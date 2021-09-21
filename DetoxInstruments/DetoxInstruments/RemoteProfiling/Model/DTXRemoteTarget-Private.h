//
//  DTXRemoteTarget-Private.h
//  DetoxInstruments
//
//  Created by Leo Natan on 23/07/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXRemoteTarget.h"
#import "LNSocketConnection.h"

@interface DTXRemoteTarget ()

@property (nonatomic, assign, readwrite) NSUInteger deviceOSType;
@property (nonatomic, copy, readwrite) NSString* appName;
@property (nonatomic, copy, readwrite) NSString* deviceName;
@property (nonatomic, copy, readwrite) NSString* devicePresentable;
@property (nonatomic, copy, readwrite) NSImage* deviceSnapshot;
@property (nonatomic, copy, readwrite) NSDictionary* deviceInfo;
@property (nonatomic, strong, readwrite) NSImage* screenSnapshot;

@property (nonatomic, copy, readonly) NSString* hostName;
@property (nonatomic, assign, readonly) NSInteger port;
@property (nonatomic, strong, readonly) dispatch_queue_t workQueue;

- (void)_connectWithHostName:(NSString*)hostName port:(NSInteger)port workQueue:(dispatch_queue_t)workQueue;

@end
