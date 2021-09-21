//
//  DTXRecording+Additions.h
//  DTXProfiler
//
//  Created by Leo Natan on 18/05/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXRecording+CoreDataClass.h"
#import "DTXProfilingConfiguration.h"

@interface DTXRecording (Additions)

@property (nonatomic, strong, readonly) DTXProfilingConfiguration* dtx_profilingConfiguration;

@end
