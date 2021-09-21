//
//  DTXIntervalSamplePlotController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 6/20/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSamplePlotController.h"

@interface DTXIntervalSamplePlotController : DTXSamplePlotController

- (NSDate*)endTimestampForSample:(__kindof DTXSample*)sample;
- (NSColor*)colorForSample:(__kindof DTXSample*)sample;
- (NSString*)titleForSample:(__kindof DTXSample*)sample;

+ (Class)classForIntervalSamples;
- (NSPredicate*)predicateForPerformanceSamples;

- (NSArray<NSSortDescriptor*>*)sortDescriptors;
- (NSString*)sectionKeyPath;
- (void)invalidateSections;

@end
