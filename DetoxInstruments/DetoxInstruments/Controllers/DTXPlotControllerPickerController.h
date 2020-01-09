//
//  DTXPlotControllerPickerController.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 8/12/18.
//  Copyright © 2017-2020 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXManagedPlotControllerGroup.h"
#import "DTXPlotController.h"

@class DTXPlotControllerPickerController;

@interface DTXPlotControllerPickerController : NSViewController

@property (nonatomic, strong) DTXManagedPlotControllerGroup* managedPlotControllerGroup;

@end
