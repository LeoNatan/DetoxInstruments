//
//  DTXRecordingTargetPickerViewController+DocumentationGeneration.h
//  DetoxInstruments
//
//  Created by Leo Natan on 5/9/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#if DEBUG

#import "DTXRecordingTargetPickerViewController.h"
#import "DTXLiveLogWindowController.h"
#import "DTXProfilingTargetManagementWindowController.h"

@interface DTXRecordingTargetPickerViewController (DocumentationGeneration)

- (void)_addFakeTarget;
- (DTXLiveLogWindowController*)_openLiveConsoleWindowController;
- (DTXProfilingTargetManagementWindowController*)_openManagementWindowController;

@end

#endif
