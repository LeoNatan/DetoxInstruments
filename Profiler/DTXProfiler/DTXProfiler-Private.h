//
//  DTXProfiler-Private.h
//  DTXProfiler
//
//  Created by Leo Natan on 19/07/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXProfilingBasics.h"
#import <DTXProfiler/DTXProfiler.h>
#import <pthread.h>
#import "DTXPerformanceSampler.h"
#import "DTXNetworkRecorder.h"
#import "DTXInstrumentsModel.h"
//#import "DTXProfilerAPI-Private.h"

typedef NS_ENUM(NSUInteger, _DTXEventType)
{
	_DTXEventTypeSignpost,
	_DTXEventTypeActivity,
};

DTX_ALWAYS_INLINE
static Class _DTXClassForEventType(_DTXEventType eventType)
{
	switch (eventType) {
		case _DTXEventTypeSignpost:
			return DTXSignpostSample.class;
		case _DTXEventTypeActivity:
			return DTXActivitySample.class;
	}
}

DTX_ALWAYS_INLINE
static BOOL _DTXShouldIgnoreEvent(_DTXEventType eventType, NSString* category, DTXProfilingConfiguration* config)
{
	if(eventType == _DTXEventTypeActivity && config.recordActivity == NO)
	{
		return YES;
	}
	
	Class targetClass = _DTXClassForEventType(eventType);
	
	if(targetClass == DTXSignpostSample.class && config.recordEvents == NO)
	{
		return YES;
	}
	
	if(targetClass == DTXSignpostSample.class && [config.ignoredEventCategories containsObject:category])
	{
		return YES;
	}
	
	return NO;
}

@interface DTXProfiler ()

@property (nonatomic, weak, getter=_profilerStoryListener, setter=_setInternalDelegate:) id<DTXProfilerStoryListener> _profilerStoryListener;

@property (nonatomic) BOOL _cleanForDemo;

- (void)_symbolicatePerformanceSample:(DTXPerformanceSample*)sample;

- (DTXThreadInfo*)_threadForThreadIdentifier:(uint64_t)identifier;

//Private methods called from external API per active profiler.

- (void)_addTag:(NSString*)tag timestamp:(NSDate*)timestamp;
- (void)_addLogLine:(NSString *)line objects:(NSArray *)objects timestamp:(NSDate*)timestamp;
- (void)_addLogEntry:(NSString *)line timestamp:(NSDate*)timestamp subsystem:(NSString*)subsystem category:(NSString*)category level:(DTXProfilerLogLevel)level;
- (void)_markEventIntervalBeginWithIdentifier:(NSString*)identifier category:(NSString*)category name:(NSString*)name additionalInfo:(NSString*)additionalInfo eventType:(_DTXEventType)eventType stackTrace:(NSArray*)stackTrace threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp;
- (void)_markEventIntervalEndWithIdentifier:(NSString*)identifier eventStatus:(DTXEventStatus)eventStatus additionalInfo:(NSString*)additionalInfo threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp;
- (void)_markEventWithIdentifier:(NSString*)identifier category:(NSString*)category name:(NSString*)name eventStatus:(DTXEventStatus)eventStatus additionalInfo:(NSString*)additionalInfo eventType:(_DTXEventType)eventType threadIdentifier:(uint64_t)threadIdentifier timestamp:(NSDate*)timestamp;
- (void)_networkRecorderDidStartRequest:(NSURLRequest*)request cookieHeaders:(NSDictionary<NSString*, NSString*>*)cookieHeaders userAgent:(NSString*)userAgent uniqueIdentifier:(NSString*)uniqueIdentifier timestamp:(NSDate*)timestamp;
- (void)_networkRecorderDidFinishWithResponse:(NSURLResponse*)response data:(NSData*)data error:(NSError*)error forRequestWithUniqueIdentifier:(NSString*)uniqueIdentifier timestamp:(NSDate*)timestamp;

@end
