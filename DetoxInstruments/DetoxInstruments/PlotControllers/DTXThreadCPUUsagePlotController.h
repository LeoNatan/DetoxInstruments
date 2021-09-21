//
//  DTXThreadCPUUsagePlotController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 19/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXCPUUsagePlotController.h"

@interface DTXThreadCPUUsagePlotController : DTXCPUUsagePlotController

- (instancetype)initWithDocument:(DTXRecordingDocument*)document isForTouchBar:(BOOL)isForTouchBar NS_UNAVAILABLE;
- (instancetype)initWithDocument:(DTXRecordingDocument*)document threadInfo:(DTXThreadInfo*)threadInfo isForTouchBar:(BOOL)isForTouchBar;

@end
	
