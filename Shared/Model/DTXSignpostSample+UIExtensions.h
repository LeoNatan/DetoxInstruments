//
//  DTXSignpostSample+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 6/24/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSignpostSample+CoreDataClass.h"
@import CoreData;
@import AppKit;
@class DTXRecording;
#import "DTXSignpostProtocol.h"
#import "DTXThreadInfo+UIExtensions.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTXSignpostSample (UIExtensions) <DTXSignpost>

+ (NSUInteger)countOfSamplesInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;
+ (NSUInteger)countOfSignpostSamplesInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;
+ (BOOL)hasSignpostSamplesInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;
- (NSString*)eventTypeString;
- (NSString*)eventStatusString;
#if ! CLI
- (NSColor*)plotControllerColor;
#endif
- (NSDate*)defactoEndTimestamp;

- (DTXThreadInfo*)startThread;
- (DTXThreadInfo*)endThread;

@end

NS_ASSUME_NONNULL_END
