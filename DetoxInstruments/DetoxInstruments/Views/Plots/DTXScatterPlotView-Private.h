//
//  DTXScatterPlotView-Private.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/31/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXPlotView-Private.h"
#import "DTXScatterPlotView.h"
#import "DTXPlotHeightSynchronization.h"

@interface DTXScatterPlotView ()

@property (nonatomic) double maxHeight;
@property (nonatomic, weak) id<DTXPlotHeightSynchronization> heightSynchronizer;
@property (nonatomic) NSUInteger previousIndexOf;

@end
