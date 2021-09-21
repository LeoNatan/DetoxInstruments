//
//  DTXPlotController-Private.h
//  DetoxInstruments
//
//  Created by Leo Natan on 1/3/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXPlotController.h"

@protocol DTXPlotControllerPrivate <DTXPlotController>

- (void)_removeHighlightNotifyingDelegate:(BOOL)notify;

@end
