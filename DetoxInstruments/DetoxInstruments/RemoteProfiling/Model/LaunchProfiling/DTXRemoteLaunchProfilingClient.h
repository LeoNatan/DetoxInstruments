//
//  DTXRemoteLaunchProfilingClient.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/1/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTXRemoteLaunchProfilingClient, DTXRemoteTarget;

@protocol DTXRemoteLaunchProfilingClientDelegate <NSObject>

- (void)remoteLaunchProfilingClientDidConnect:(DTXRemoteLaunchProfilingClient*)client;
- (void)remoteLaunchProfilingClient:(DTXRemoteLaunchProfilingClient*)client didFinishLaunchProfilingWithZippedData:(NSData*)zippedData;

@end

@interface DTXRemoteLaunchProfilingClient : NSObject

@property (nonatomic, strong, readonly) DTXRemoteTarget* target;
@property (nonatomic, weak) id<DTXRemoteLaunchProfilingClientDelegate> delegate;

- (instancetype)initWithLaunchProfilingSessionID:(NSString*)session;

- (void)startConnecting;
- (void)stop;

@end
