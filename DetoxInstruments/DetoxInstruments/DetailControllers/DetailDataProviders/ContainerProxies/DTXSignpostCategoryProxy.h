//
//  DTXSignpostCategoryProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan on 7/2/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSampleAggregatorProxy.h"
#import "DTXSignpostProtocol.h"

@interface DTXSignpostCategoryProxy : DTXSampleAggregatorProxy <DTXSignpost>

@property (nonatomic, strong, readonly) NSString* category;

- (instancetype)initWithCategory:(NSString*)category managedObjectContext:(NSManagedObjectContext*)managedObjectContext outlineView:(NSOutlineView*)outlineView;

@end
