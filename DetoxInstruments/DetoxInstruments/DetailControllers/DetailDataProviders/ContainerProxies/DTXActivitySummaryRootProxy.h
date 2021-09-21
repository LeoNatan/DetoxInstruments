//
//  DTXActivitySummaryRootProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan on 7/1/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSampleAggregatorProxy.h"

@interface DTXActivitySummaryRootProxy : DTXSampleAggregatorProxy

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext*)managedObjectContext outlineView:(NSOutlineView*)outlineView enabledCategories:(NSSet<NSString*>*)enabledCategories;

@end
