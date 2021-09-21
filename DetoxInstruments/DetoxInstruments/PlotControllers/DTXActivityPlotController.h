//
//  DTXActivityPlotController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 6/24/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXIntervalSamplePlotController.h"

extern NSString* const DTXActivityPlotEnabledCategoriesDidChange;

@interface DTXActivityPlotController : DTXIntervalSamplePlotController

#if ! PROFILER_PREVIEW_EXTENSION
- (NSSet<NSString*>*)enabledCategories;
#endif

@end
