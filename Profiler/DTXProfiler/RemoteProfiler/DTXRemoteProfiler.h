//
//  DTXRemoteProfiler.h
//  DTXProfiler
//
//  Created by Leo Natan on 19/07/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXProfiler-Private.h"
#import "LNSocketConnection.h"

@class DTXRemoteProfiler;

@protocol DTXRemoteProfilerDelegate <NSObject>

- (void)remoteProfiler:(DTXRemoteProfiler*)remoteProfiler didFinishWithError:(NSError*)error;

@end

@interface DTXRemoteProfiler : DTXProfiler

- (instancetype)initWithOpenedSocketConnection:(LNSocketConnection*)connection remoteProfilerDelegate:(id<DTXRemoteProfilerDelegate>)remoteProfilerDelegate;

@property (nonatomic, weak, readonly) id<DTXRemoteProfilerDelegate> remoteProfilerDelegate;

@end
