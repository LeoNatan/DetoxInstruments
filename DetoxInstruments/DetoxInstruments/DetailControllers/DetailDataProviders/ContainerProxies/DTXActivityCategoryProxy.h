//
//  DTXSignpostNameProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan on 7/2/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXSampleContainerProxy.h"
#import "DTXRecording+Additions.h"
#import "DTXSignpostProtocol.h"

@interface DTXActivityCategoryProxy : DTXSampleContainerProxy <DTXSignpost>

@property (nonatomic, strong, readonly) NSString* category;

- (instancetype)initWithCategory:(NSString*)category managedObjectContext:(NSManagedObjectContext*)managedObjectContext outlineView:(NSOutlineView*)outlineView;

@end
