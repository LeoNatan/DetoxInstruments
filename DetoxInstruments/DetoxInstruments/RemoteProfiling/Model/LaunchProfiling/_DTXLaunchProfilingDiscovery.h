//
//  _DTXLaunchProfilingDiscovery.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/1/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTXRemoteTarget;

@interface _DTXLaunchProfilingDiscovery : NSObject

- (instancetype)initWithSessionID:(NSString*)session completionHandler:(void(^)(DTXRemoteTarget* target))completionHandler;
- (void)stop;

@end
