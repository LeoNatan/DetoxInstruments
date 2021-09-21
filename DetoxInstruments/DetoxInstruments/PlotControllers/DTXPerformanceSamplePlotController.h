//
//  DTXPerformanceSamplePlotController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 04/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXSamplePlotController.h"

@interface DTXPerformanceSamplePlotController : DTXSamplePlotController

+ (Class)classForPerformanceSamples;
- (NSPredicate*)predicateForPerformanceSamples;

+ (Class)classForPlotViews;

- (CGFloat)plotHeightMultiplier;
- (CGFloat)minimumValueForPlotHeight;

- (NSArray*)samplesForPlotIndex:(NSUInteger)index;
- (NSArray<NSString*>*)sampleKeys;
- (BOOL)isStepped;


@end
