//
//  NSURLConnection+DTXLegacyConnectionRecording.m
//  DTXProfiler
//
//  Created by Leo Natan on 10/21/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "NSURLConnection+DTXLegacyConnectionRecording.h"
#import "DTXProfilerAPI-Private.h"
#import "NSObject+AttachedObjects.h"
@import ObjectiveC;

extern thread_local BOOL _protocolLoading;

static void* __DTXConnectionUnique = &__DTXConnectionUnique;

static void* __DTXConnectionDidStart = &__DTXConnectionDidStart;
static void* __DTXConnectionDidFail = &__DTXConnectionDidFail;
static void* __DTXConnectionResponse = &__DTXConnectionResponse;
static void* __DTXConnectionData = &__DTXConnectionData;

@interface __DTX_DelegateProxy : NSObject <NSURLConnectionDataDelegate> @end

@implementation __DTX_DelegateProxy

- (nullable NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(nullable NSURLResponse *)response
{
	if([[self ln_attachedObjectForKey:__DTXConnectionDidStart] boolValue] == NO)
	{
		__DTXProfilerMarkNetworkRequestBegin(request, [connection ln_attachedObjectForKey:__DTXConnectionUnique], NSDate.date);
		[self ln_attachObject:@YES forKey:__DTXConnectionDidStart];
	}
	
	NSURLRequest* rv = request;
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connection:willSendRequest:redirectResponse:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		NSURLRequest* (*super_class)(struct objc_super*, SEL, id, id, id) = (void*)objc_msgSendSuper;
		rv = super_class(&super, cmd, connection, request, response);
	}
	return rv;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	if(error != nil)
	{
		[self ln_attachObject:@YES forKey:__DTXConnectionDidFail];
		
		__DTXProfilerMarkNetworkResponseEnd([self ln_attachedObjectForKey:__DTXConnectionResponse], [self ln_attachedObjectForKey:__DTXConnectionData], error, [connection ln_attachedObjectForKey:__DTXConnectionUnique], NSDate.date);
	}
	
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connection:didFailWithError:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id, id) = (void*)objc_msgSendSuper;
		super_class(&super, cmd, connection, error);
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[self ln_attachObject:[response copy] forKey:__DTXConnectionResponse];
	
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connection:didReceiveResponse:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id, id) = (void*)objc_msgSendSuper;
		super_class(&super, cmd, connection, response);
	}
}

- (void)__dtx_appendAttachedData:(NSData*)data
{
	NSMutableData* aggregatedData = [self ln_attachedObjectForKey:__DTXConnectionData];
	if(aggregatedData == nil)
	{
		aggregatedData = [NSMutableData new];
	}
	
	[aggregatedData appendData:data];
	
	[self ln_attachObject:aggregatedData forKey:__DTXConnectionData];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data lengthReceived:(long long)lengthReceived
{
	[self __dtx_appendAttachedData:data];
	
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connection:didReceiveData:lengthReceived:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id, id, long long) = (void*)objc_msgSendSuper;
		super_class(&super, cmd, connection, data, lengthReceived);
	}
	else if([superclass instancesRespondToSelector:@selector(connection:didReceiveData:)])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id, id) = (void*)objc_msgSendSuper;
		super_class(&super, @selector(connection:didReceiveData:), connection, data);
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[self __dtx_appendAttachedData:data];
	
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connection:didReceiveData:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id, id) = (void*)objc_msgSendSuper;
		super_class(&super, cmd, connection, data);
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if([[self ln_attachedObjectForKey:__DTXConnectionDidFail] boolValue] == NO)
	{
		__DTXProfilerMarkNetworkResponseEnd([self ln_attachedObjectForKey:__DTXConnectionResponse], [self ln_attachedObjectForKey:__DTXConnectionData], nil, [connection ln_attachedObjectForKey:__DTXConnectionUnique], NSDate.date);
	}
	
	Class superclass = LNDynamicSubclassSuper(self, __DTX_DelegateProxy.class);
	SEL cmd = @selector(connectionDidFinishLoading:);
	if([superclass instancesRespondToSelector:cmd])
	{
		struct objc_super super = {.receiver = self, .super_class = superclass};
		void (*super_class)(struct objc_super*, SEL, id) = (void*)objc_msgSendSuper;
		super_class(&super, cmd, connection);
	}
}

@end

@interface NSURLConnection ()

- (id)_initWithRequest:(id)arg1 delegate:(id)arg2 usesCache:(_Bool)arg3 maxContentLength:(long long)arg4 startImmediately:(_Bool)arg5 connectionProperties:(id)arg6;

@end

@implementation NSURLConnection (DTXLegacyConnectionRecording)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSError* error;
		LNSwizzleMethod(self, @selector(_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:), @selector(_initWithRequest___dtx:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:), &error);
	});
}

- (id)_initWithRequest___dtx:(NSURLRequest*)arg1 delegate:(id<NSURLConnectionDelegate>)origDelegate usesCache:(BOOL)arg3 maxContentLength:(long long)arg4 startImmediately:(BOOL)arg5 connectionProperties:(id)arg6
{
	if(origDelegate != nil)
	{
		LNDynamicallySubclass(origDelegate, __DTX_DelegateProxy.class);
	}
	
	if(origDelegate == nil)
	{
		origDelegate = [__DTX_DelegateProxy new];
	}
	
	NSMutableURLRequest* arg1_ = [arg1 mutableCopy];
	
	DTXProfilingConfiguration* config = __DTXProfilerGetActiveConfiguration();
	if(config != nil && config.disableNetworkCache == YES)
	{
		arg1_.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
	}
	
	self = [self _initWithRequest___dtx:arg1_ delegate:origDelegate usesCache:arg3 maxContentLength:arg4 startImmediately:arg5 connectionProperties:arg6];
	
	[self ln_attachObject:[NSProcessInfo processInfo].globallyUniqueString forKey:__DTXConnectionUnique];
	
	return self;
}

@end
