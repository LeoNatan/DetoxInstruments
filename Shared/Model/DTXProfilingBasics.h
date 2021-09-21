//
//  DTXRemoteProfilingBasics.h
//  DTXProfiler
//
//  Created by Leo Natan on 23/07/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

@class NSEntityDescription;

#if __has_include("DTXEventStatusPrivate.h")
	#import "DTXEventStatusPrivate.h"
#endif

typedef NS_ENUM(NSUInteger, DTXRemoteProfilingCommandType) {
	DTXRemoteProfilingCommandTypePing = 0,
	DTXRemoteProfilingCommandTypeGetDeviceInfo = 1,
	DTXRemoteProfilingCommandTypeStartProfilingWithConfiguration = 2,
	DTXRemoteProfilingCommandTypeStartLaunchProfilingWithConfiguration = 20,
	DTXRemoteProfilingCommandTypeStartLocalProfilingWithConfiguration = 21,
	DTXRemoteProfilingCommandTypeAddTag = 3,
	DTXRemoteProfilingCommandTypePushGroup __deprecated = 4,
	DTXRemoteProfilingCommandTypePopGroup __deprecated = 5,
	DTXRemoteProfilingCommandTypeProfilingStoryEvent = 6,
	DTXRemoteProfilingCommandTypeStopProfiling = 7,
	
	DTXRemoteProfilingCommandTypeGetContainerContents = 8,
	DTXRemoteProfilingCommandTypeDownloadContainer = 9,
	DTXRemoteProfilingCommandTypeDeleteContainerIten = 10,
	DTXRemoteProfilingCommandTypePutContainerItem = 11,
	
	DTXRemoteProfilingCommandTypeGetUserDefaults = 12,
	DTXRemoteProfilingCommandTypeChangeUserDefaultsItem = 13,
	
	DTXRemoteProfilingCommandTypeGetCookies = 14,
	DTXRemoteProfilingCommandTypeSetCookies = 15,
	
	DTXRemoteProfilingCommandTypeGetPasteboard = 16,
	DTXRemoteProfilingCommandTypeSetPasteboard = 17,
	
	DTXRemoteProfilingCommandTypeStartLogging = 24,
	DTXRemoteProfilingCommandTypeLogEntry = 25,
	DTXRemoteProfilingCommandTypeStopLogging = 26,
	
	DTXRemoteProfilingCommandTypeCaptureViewHierarchy = 18,
	
	DTXRemoteProfilingCommandTypeLoadScreenSnapshot = 19,
};

typedef NS_ENUM(NSUInteger, DTXRemoteProfilingChangeType) {
	DTXRemoteProfilingChangeTypeInsert,
	DTXRemoteProfilingChangeTypeDelete,
	DTXRemoteProfilingChangeTypeMove,
	DTXRemoteProfilingChangeTypeUpdate,
	
	DTXRemoteProfilingChangeTypeClear
};

@class DTXRecording, DTXPerformanceSample;
@class DTXThreadInfo, DTXNetworkSample, DTXLogSample, DTXTag;
@class DTXSignpostSample;

@protocol DTXProfilerStoryListener <NSObject>

- (void)createRecording:(DTXRecording*)recording;
- (void)updateRecording:(DTXRecording*)recording stopRecording:(BOOL)stopRecording;
- (void)createdOrUpdatedThreadInfo:(DTXThreadInfo*)threadInfo;
- (void)addPerformanceSample:(__kindof DTXPerformanceSample*)perfrmanceSample;
- (void)startRequestWithNetworkSample:(DTXNetworkSample*)networkSample;
- (void)finishWithResponseForNetworkSample:(DTXNetworkSample*)networkSample;
- (void)addLogSample:(DTXLogSample*)logSample;
- (void)addTagSample:(DTXTag*)tag;
- (void)markEventIntervalBegin:(DTXSignpostSample*)signpostSample;
- (void)markEventIntervalEnd:(DTXSignpostSample*)signpostSample;
- (void)markEvent:(DTXSignpostSample*)signpostSample;

@end

@protocol DTXProfilerStoryDecoder <NSObject>

- (void)performBlock:(void(^)(void))block;
- (void)performBlockAndWait:(void(^)(void))block;

- (void)willDecodeStoryEvent;
- (void)didDecodeStoryEvent;

- (void)createRecording:(NSDictionary*)recording entityDescription:(NSEntityDescription*)entityDescription;
- (void)updateRecording:(NSDictionary*)recording stopRecording:(NSNumber*)stopRecording entityDescription:(NSEntityDescription*)entityDescription;
- (void)createdOrUpdatedThreadInfo:(NSDictionary*)threadInfo entityDescription:(NSEntityDescription*)entityDescription;
- (void)addPerformanceSample:(NSDictionary*)perfrmanceSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)addRNPerformanceSample:(NSDictionary *)rnPerfrmanceSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)startRequestWithNetworkSample:(NSDictionary*)networkSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)finishWithResponseForNetworkSample:(NSDictionary*)networkSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)addRNBridgeDataSample:(NSDictionary*)rnBridgeDataSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)addRNAsyncStorageSample:(NSDictionary*)rnAsyncStorageSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)addLogSample:(NSDictionary*)logSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)addTagSample:(NSDictionary*)tag entityDescription:(NSEntityDescription*)entityDescription;
- (void)markEventIntervalBegin:(NSDictionary*)signpostSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)markEventIntervalEnd:(NSDictionary*)signpostSample entityDescription:(NSEntityDescription*)entityDescription;
- (void)markEvent:(NSDictionary*)signpostSample entityDescription:(NSEntityDescription*)entityDescription;


@end
