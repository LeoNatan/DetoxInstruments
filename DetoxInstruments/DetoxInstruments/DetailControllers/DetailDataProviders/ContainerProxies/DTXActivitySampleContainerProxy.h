//
//  DTXActivitySampleContainerProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/25/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXEntitySampleContainerProxy.h"

@interface DTXActivitySampleContainerProxy : DTXEntitySampleContainerProxy

- (instancetype)initWithOutlineView:(NSOutlineView *)outlineView managedObjectContext:(NSManagedObjectContext *)managedObjectContext sampleClass:(Class)sampleClass enabledCategories:(NSSet<NSString*>*)enabledCategories;

@end
