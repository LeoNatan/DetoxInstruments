//
//  DTXPlotHostingTableCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 01/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXPlotController.h"

@interface DTXPlotHostingTableCellView : NSTableCellView

@property (nonatomic, weak) id<DTXPlotController> plotController;

@end
