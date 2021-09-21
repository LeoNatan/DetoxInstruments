//
//  DTXProfilingConfiguration+RemoteProfilingSupport.h
//  DetoxInstruments
//
//  Created by Leo Natan on 07/08/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXProfilingConfiguration.h"

@interface DTXProfilingConfiguration (RemoteProfilingSupport)

+ (void)registerRemoteProfilingDefaults;
+ (void)resetRemoteProfilingDefaults;
+ (instancetype)profilingConfigurationForRemoteProfilingFromDefaults;

@end
