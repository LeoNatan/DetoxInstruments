//
//  DTXSamplePlotController-Private.h
//  DetoxInstruments
//
//  Created by Leo Natan on 1/3/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXSamplePlotController.h"
#import "DTXPlotController-Private.h"

@interface DTXSamplePlotController () <DTXPlotControllerPrivate>

- (void)_resetCachedPlotColors;
- (NSColor*)_plotColorForIdx:(NSUInteger)idx;
- (NSColor*)_additionalPlotColorForIdx:(NSUInteger)idx;

- (void)_highlightSample:(DTXSample*)sample sampleIndex:(NSUInteger)sampleIdx plotIndex:(NSUInteger)plotIndex positionInPlot:(double)position valueAtClickPosition:(double)value;

@end
