//
//  DTXRemoteProfiler.m
//  DTXProfiler
//
//  Created by Leo Natan on 19/07/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXRemoteProfiler.h"
#import "AutoCoding.h"
#import "DTXInstruments+CoreDataModel.h"
#import "NSManagedObject+Additions.h"
#import "DTXProfilingBasics.h"
#import "NSManagedObjectContext+PerformQOSBlock.h"
#import "NSString+Hashing.h"
#import "DTXSample+Additions.h"

LN_CREATE_LOG(RemoteProfiler);

@interface DTXProfiler ()

+ (NSManagedObjectModel*)_modelForProfiler;

@end

@interface DTXRemoteProfiler () <DTXProfilerStoryListener>

@end

@implementation DTXRemoteProfiler
{
	LNSocketConnection* _socketConnection;
	NSManagedObjectContext* _ctx;
	
	NSMutableDictionary<NSString*, id>* _pendingEvents;
	NSMutableDictionary<NSString*, id>* _pendingNetworkRequests;
}

- (instancetype)init
{
	self = [super init];
	
	if(self)
	{
		self._profilerStoryListener = self;
		_pendingEvents = [NSMutableDictionary new];
		_pendingNetworkRequests = [NSMutableDictionary new];
	}
	
	return self;
}

- (instancetype)initWithOpenedSocketConnection:(LNSocketConnection*)connection remoteProfilerDelegate:(id<DTXRemoteProfilerDelegate>)remoteProfilerDelegate
{
	self = [self init];
	
	if(self)
	{
		_remoteProfilerDelegate = remoteProfilerDelegate;
		
		_socketConnection = connection;
	}
	
	return self;
}

- (NSPersistentContainer*)_persistentStoreForProfilingDeleteExisting:(BOOL)deleteExisting
{
	NSPersistentStoreDescription* description = [NSPersistentStoreDescription persistentStoreDescriptionWithURL:[NSURL URLWithString:@""]];
	description.type = NSInMemoryStoreType;
	
	NSPersistentContainer* rv = [NSPersistentContainer persistentContainerWithName:@"DTXInstruments" managedObjectModel:self.class._modelForProfiler];
	rv.persistentStoreDescriptions = @[description];
	
	return rv;
}

- (void)_closeContainerInternal
{
	
}

- (void)_addPendingSampleInternal:(DTXSample*)pendingSample
{
	
}

- (void)_flushPendingSamplesInternal
{
	
}

static id _NSNullCleanup(id obj)
{
	if([obj isKindOfClass:NSNull.class])
	{
		return @"<null>";
	}
	else if([obj isKindOfClass:NSArray.class])
	{
		NSArray* arr = obj;
		NSMutableArray* rv = [[NSMutableArray alloc] initWithCapacity:arr.count];
		for (id elem in arr)
		{
			[rv addObject:_NSNullCleanup(elem)];
		}
		return rv;
	}
	else if([obj isKindOfClass:NSDictionary.class])
	{
		NSDictionary* dict = obj;
		NSMutableDictionary* rv = [[NSMutableDictionary alloc] initWithCapacity:dict.count];
		for (id key in dict.keyEnumerator)
		{
			[rv setObject:_NSNullCleanup(dict[key]) forKey:key];
		}
		return rv;
	}
	
	return obj;
}

- (void)_serializeCommandWithSelector:(SEL)selector managedObject:(NSManagedObject*)obj additionalParams:(NSArray*)additionalParams
{
	[self _serializeCommandWithSelector:selector entityName:obj.entity.name dict:obj.dictionaryRepresentationForPropertyList additionalParams:additionalParams];
}

- (void)_serializeCommandWithSelector:(SEL)selector entityName:(NSString*)entityName dict:(NSDictionary*)obj additionalParams:(NSArray*)additionalParams
{
	NSMutableDictionary* cmd = [@{@"cmdType": @(DTXRemoteProfilingCommandTypeProfilingStoryEvent), @"entityName": entityName, @"selector": NSStringFromSelector(selector), @"object": obj} mutableCopy];
	cmd[@"additionalParams"] = additionalParams;
	
	NSError* err;
	NSData* plistData = [NSPropertyListSerialization dataWithPropertyList:cmd format:NSPropertyListBinaryFormat_v1_0 options:0 error:&err];
	if(plistData == nil)
	{
		//🤦‍♂️
		//Need to find a better solution—perhaps after replacing the serialization tech.
		cmd = _NSNullCleanup(cmd);
		plistData = [NSPropertyListSerialization dataWithPropertyList:cmd format:NSPropertyListBinaryFormat_v1_0 options:0 error:&err];
	}
	
	NSAssert(plistData != nil, @"Unable to encode data to property list: %@", err.localizedDescription);
	
	[_socketConnection sendMessage:plistData completionHandler:^(NSError * _Nullable error) {
		if(error)
		{
			ln_log_error(@"Remote profiler hit error: %@", error);
		}
	}];
}

- (void)stopProfilingWithCompletionHandler:(void (^)(NSError * _Nullable))completionHandler
{
	[super stopProfilingWithCompletionHandler:^ (NSError* err) {
		if(completionHandler)
		{
			completionHandler(err);
		}
	}];
}

#pragma mark _DTXProfilerStoryListener

- (void)createdOrUpdatedThreadInfo:(DTXThreadInfo *)threadInfo
{
	[self _serializeCommandWithSelector:_cmd managedObject:threadInfo additionalParams:nil];
}

- (void)_addLogLine:(NSString *)line objects:(NSArray *)objects timestamp:(NSDate*)timestamp
{
	[_ctx performBlock:^{
		NSMutableDictionary* preserialized = @{
			@"__dtx_className": @"DTXLogSample",
			@"__dtx_entityName": @"LogSample",
			@"line": line ?: @"",
			@"sampleIdentifier": NSUUID.UUID.UUIDString,
			@"sampleType": @(DTXSampleTypeLog),
			@"timestamp": timestamp,
		}.mutableCopy;
		
		if(objects.count > 0)
		{
			preserialized[objects] = objects;
		}
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"addLogSample:") entityName:@"LogSample" dict:preserialized additionalParams:nil];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)_addLogEntry:(NSString *)line timestamp:(NSDate *)timestamp subsystem:(NSString *)subsystem category:(NSString *)category level:(DTXProfilerLogLevel)level
{
	[_ctx performBlock:^{
		NSMutableDictionary* preserialized = @{
			@"__dtx_className": @"DTXLogSample",
			@"__dtx_entityName": @"LogSample",
			@"line": line ?: @"",
			@"sampleIdentifier": NSUUID.UUID.UUIDString,
			@"sampleType": @(DTXSampleTypeLog),
			@"level": @(level),
			@"timestamp": timestamp,
		}.mutableCopy;
		
		if(subsystem)
		{
			preserialized[@"subsystem"] = subsystem;
		}
		
		if(category)
		{
			preserialized[@"category"] = category;
		}
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"addLogSample:") entityName:@"LogSample" dict:preserialized additionalParams:nil];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)addPerformanceSample:(__kindof DTXPerformanceSample *)performanceSample
{
	if(self.profilingConfiguration.collectStackTraces && self.profilingConfiguration.symbolicateStackTraces && [performanceSample stackTraceIsSymbolicated] == NO)
	{
		[self _symbolicatePerformanceSample:performanceSample];
	}
	
	[self _serializeCommandWithSelector:_cmd managedObject:performanceSample additionalParams:nil];
	
	[performanceSample.managedObjectContext deleteObject:performanceSample];
	[performanceSample.managedObjectContext save:NULL];
}

- (void)createRecording:(DTXRecording *)recording
{
	NSMutableDictionary* recordingDict = recording.dictionaryRepresentationForPropertyList.mutableCopy;
	NSMutableDictionary* configuration = [recordingDict[@"profilingConfiguration"] mutableCopy];
	configuration[@"recordingFileName"] = self.profilingConfiguration.recordingFileURL.path;
	recordingDict[@"profilingConfiguration"] = configuration;
	
	[self _serializeCommandWithSelector:_cmd entityName:recording.entity.name dict:recordingDict additionalParams:nil];
	
	_ctx = recording.managedObjectContext;
}

- (void)_networkRecorderDidStartRequest:(NSURLRequest*)request cookieHeaders:(NSDictionary<NSString*, NSString*>*)cookieHeaders userAgent:(NSString*)userAgent uniqueIdentifier:(NSString*)uniqueIdentifier timestamp:(NSDate*)timestamp
{
	if(self.profilingConfiguration.recordNetwork == NO)
	{
		return;
	}
	
	if(self.profilingConfiguration.recordLocalhostNetwork == NO && ([request.URL.host isEqualToString:@"localhost"] || [request.URL.host isEqualToString:@"127.0.0.1"]))
	{
		return;
	}
	
	[_ctx performBlock:^{
		NSMutableDictionary* preserialized = @{
											   @"__dtx_className": @"DTXNetworkSample",
											   @"__dtx_entityName": @"NetworkSample",
											   @"sampleIdentifier": NSUUID.UUID.UUIDString,
											   @"sampleType": @50,
											   @"timestamp": timestamp,
											   @"uniqueIdentifier": uniqueIdentifier,
											   @"url": request.URL.absoluteString,
											   @"requestTimeoutInterval": @(request.timeoutInterval),
											   @"requestDataLength": @(request.HTTPBody.length + request.allHTTPHeaderFields.description.length),
											   }.mutableCopy;
		
		if(request.HTTPMethod.length > 0)
		{
			preserialized[@"requestHTTPMethod"] = request.HTTPMethod;
		}
		
		NSMutableDictionary* requestHeaders = request.allHTTPHeaderFields.mutableCopy ?: [NSMutableDictionary new];
		if(cookieHeaders != nil && requestHeaders[@"Cookie"] == nil)
		{
			[requestHeaders addEntriesFromDictionary:cookieHeaders];
		}
		if(userAgent != nil && requestHeaders[@"User-Agent"] == nil)
		{
			[requestHeaders setObject:userAgent forKey:@"User-Agent"];
		}
		
		if(requestHeaders.count > 0)
		{
			preserialized[@"requestHeaders"] = requestHeaders;
			preserialized[@"requestHeadersFlat"] = requestHeaders.debugDescription;
		}
		
		if(request.HTTPBody.length > 0)
		{
			NSDictionary* requestDataPreserialized = @{
													   @"__dtx_className": @"DTXNetworkData",
													   @"__dtx_entityName": @"NetworkData",
													   @"data": request.HTTPBody
													   };
			preserialized[@"requestData"] = requestDataPreserialized;
		}
		
		self->_pendingNetworkRequests[uniqueIdentifier] = preserialized;
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"startRequestWithNetworkSample:") entityName:@"NetworkSample" dict:preserialized additionalParams:nil];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)_networkRecorderDidFinishWithResponse:(NSURLResponse*)response data:(NSData*)data error:(NSError*)error forRequestWithUniqueIdentifier:(NSString*)uniqueIdentifier timestamp:(NSDate*)timestamp
{
	if(self.profilingConfiguration.recordNetwork == NO)
	{
		return;
	}
	
	[_ctx performBlock:^{
		if(self.profilingConfiguration.recordLocalhostNetwork == NO && ([response.URL.host isEqualToString:@"localhost"] || [response.URL.host isEqualToString:@"127.0.0.1"]))
		{
			return;
		}
		
		NSDictionary* request = self->_pendingNetworkRequests[uniqueIdentifier];
		
		if(request == nil)
		{
			return;
		}
		
		NSMutableDictionary* preserialized = @{
											   @"responseTimestamp": timestamp,
											   @"duration": @([timestamp timeIntervalSinceDate:request[@"timestamp"]]),
											   }.mutableCopy;
		
		if(error.localizedDescription.length > 0)
		{
			preserialized[@"responseError"] = error.localizedDescription;
		}
		
		if(response.suggestedFilename.length > 0)
		{
			preserialized[@"responseSuggestedFilename"] = response.suggestedFilename;
		}
		
		if(response.MIMEType.length > 0)
		{
			preserialized[@"responseMIMEType"] = response.MIMEType;
		}
		
		NSDictionary* headers;
		if([response isKindOfClass:[NSHTTPURLResponse class]])
		{
			NSHTTPURLResponse* httpResponse = (id)response;
			preserialized[@"responseStatusCode"] = @(httpResponse.statusCode);
			NSString* localizedStatusCodeString = [NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode];
			if(localizedStatusCodeString.length > 0)
			{
				preserialized[@"responseStatusCodeString"] = localizedStatusCodeString;
			}
			
			headers = httpResponse.allHeaderFields;
			if(headers.count > 0)
			{
				preserialized[@"responseHeaders"] = headers;
				preserialized[@"responseHeadersFlat"] = headers.debugDescription;
			}
		}
		
		preserialized[@"responseDataLength"] = @(data.length + headers.description.length);
		
		if(data.length > 0)
		{
			NSDictionary* responseDataPreserialized = @{
													   @"__dtx_className": @"DTXNetworkData",
													   @"__dtx_entityName": @"NetworkData",
													   @"data": data
													   };
			preserialized[@"responseData"] = responseDataPreserialized;
		}
		
		preserialized[@"sampleIdentifier"] = request[@"sampleIdentifier"];
		
		[self->_pendingNetworkRequests removeObjectForKey:uniqueIdentifier];
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"finishWithResponseForNetworkSample:") entityName:@"NetworkSample" dict:preserialized additionalParams:nil];
	}];
}

- (void)updateRecording:(DTXRecording *)recording stopRecording:(BOOL)stopRecording
{
	[self _serializeCommandWithSelector:_cmd entityName:recording.entity.name dict:recording.dictionaryRepresentationOfChangedValuesForPropertyList additionalParams:@[@(stopRecording)]];
}

- (void)addTagSample:(DTXTag*)tag
{
	[self _serializeCommandWithSelector:_cmd managedObject:tag additionalParams:nil];
	
	[tag.managedObjectContext deleteObject:tag];
	[tag.managedObjectContext save:NULL];
}

- (void)_markEventIntervalBeginWithIdentifier:(NSString*)identifier category:(NSString*)category name:(NSString*)name additionalInfo:(NSString*)additionalInfo eventType:(_DTXEventType)eventType stackTrace:(NSArray*)stackTrace threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp
{
	if(_DTXShouldIgnoreEvent(eventType, category, self.profilingConfiguration) == YES)
	{
		return;
	}
	
	[_ctx performBlock:^{
		Class targetClass = _DTXClassForEventType(eventType);
		NSString* entityName = [targetClass entity].name;
		
		NSMutableDictionary* preserialized = @{
			@"__dtx_className": NSStringFromClass(targetClass),
			@"__dtx_entityName": entityName,
			@"category": category ?: @"",
			@"categoryHash": (category ?: @"").sufficientHash,
			@"duration": @0,
			@"eventStatus": @0,
			@"name": name ?: @"",
			@"nameHash": (name ?: @"").sufficientHash,
			@"sampleIdentifier": [NSString stringWithFormat:@"%@_%@", identifier, NSUUID.UUID.UUIDString],
			@"sampleType": @([DTXSample sampleTypeFromClass:targetClass]),
			@"timestamp": timestamp,
			@"uniqueIdentifier": NSUUID.UUID.UUIDString,
			@"startThreadNumber": @([self _threadForThreadIdentifier:threadIdentifier].number),
		}.mutableCopy;
		
		if(additionalInfo.length > 0)
		{
			preserialized[@"additionalInfoStart"] = additionalInfo;
		}
		
		self->_pendingEvents[identifier] = preserialized;
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"markEventIntervalBegin:") entityName:entityName dict:preserialized additionalParams:nil];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)_markEventIntervalEndWithIdentifier:(NSString*)identifier eventStatus:(DTXEventStatus)eventStatus additionalInfo:(nullable NSString*)additionalInfo threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp
{
	[_ctx performBlock:^{
		NSDictionary* event = self->_pendingEvents[identifier];
		
		if(event == nil)
		{
			return;
		}
		
		NSString* entityName = event[@"__dtx_entityName"];
		
		NSMutableDictionary* preserialized = @{
			@"__dtx_className": event[@"__dtx_className"],
			@"__dtx_entityName": entityName,
			@"eventStatus": @(eventStatus),
			@"endTimestamp": timestamp,
			@"sampleIdentifier": event[@"sampleIdentifier"],
			@"duration": @([timestamp timeIntervalSinceDate:event[@"timestamp"]]),
			@"endThreadNumber": @([self _threadForThreadIdentifier:threadIdentifier].number),
		}.mutableCopy;
		
		if(additionalInfo.length > 0)
		{
			preserialized[@"additionalInfoEnd"] = additionalInfo;
		}
		
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"markEventIntervalEnd:") entityName:entityName dict:preserialized additionalParams:nil];
		
		[self->_pendingEvents removeObjectForKey:identifier];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)_markEventWithIdentifier:(NSString*)identifier category:(NSString*)category name:(NSString*)name eventStatus:(DTXEventStatus)eventStatus additionalInfo:(NSString*)additionalInfo eventType:(_DTXEventType)eventType threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp;
{
	if(_DTXShouldIgnoreEvent(eventType, category, self.profilingConfiguration) == YES)
	{
		return;
	}
	
	[_ctx performBlock:^{
		NSNumber* threadIdentifierObj = @([self _threadForThreadIdentifier:threadIdentifier].number);
		
		Class targetClass = _DTXClassForEventType(eventType);
		NSString* entityName = [targetClass entity].name;
		
		NSMutableDictionary* preserialized = @{
										@"__dtx_className": NSStringFromClass(targetClass),
										@"__dtx_entityName": entityName,
										@"category": category ?: @"",
										@"categoryHash": (category ?: @"").sufficientHash,
										@"duration": @0,
										@"isEvent": @1,
										@"eventStatus": @(eventStatus),
										@"name": name ?: @"",
										@"nameHash": (name ?: @"").sufficientHash,
										@"sampleIdentifier": NSUUID.UUID.UUIDString,
										@"sampleType": @([DTXSample sampleTypeFromClass:targetClass]),
										@"timestamp": timestamp,
										@"endTimestamp": timestamp,
										@"uniqueIdentifier": NSUUID.UUID.UUIDString,
										@"startThreadNumber": threadIdentifierObj,
										@"endsThreadNumber": threadIdentifierObj,
										}.mutableCopy;
		
		if(additionalInfo.length > 0)
		{
			preserialized[@"additionalInfoStart"] = additionalInfo;
		}
		
		[self _serializeCommandWithSelector:NSSelectorFromString(@"markEvent:") entityName:entityName dict:preserialized additionalParams:nil];
	} qos:QOS_CLASS_USER_INTERACTIVE];
}

- (void)addLogSample:(DTXLogSample *)logSample {}
- (void)markEvent:(DTXSignpostSample *)signpostSample {}
- (void)markEventIntervalBegin:(DTXSignpostSample *)signpostSample {}
- (void)markEventIntervalEnd:(DTXSignpostSample *)signpostSample {}
- (void)startRequestWithNetworkSample:(DTXNetworkSample *)networkSample {}
- (void)finishWithResponseForNetworkSample:(DTXNetworkSample *)networkSample {}

@end

