//
//  DTXActivitySample+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 6/24/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXSignpostSample+UIExtensions.h"
#import "DTXActivitySample+CoreDataClass.h"
@import CoreData;
@import AppKit;
@class DTXRecording;
#import "DTXSignpostProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTXActivitySample (UIExtensions) <DTXSignpost>

+ (BOOL)hasActivitySamplesInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;
#if ! CLI
- (NSColor*)plotControllerColor;
#endif

@end

NS_ASSUME_NONNULL_END
