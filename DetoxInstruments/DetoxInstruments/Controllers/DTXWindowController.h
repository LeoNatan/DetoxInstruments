//
//  DTXWindowController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 22/05/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXPlotController.h"

@interface DTXWindowController : NSWindowController

@property (nonatomic, strong, readonly) id<DTXPlotController> currentPlotController;

@property (nonatomic, weak, readonly) NSSegmentedControl* layoutSegmentControl;

- (void)reloadTouchBar;

@end
