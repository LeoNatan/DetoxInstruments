//
//  DTXThreadInfo+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/24/18.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import "DTXThreadInfo+CoreDataClass.h"

@interface DTXThreadInfo (UIExtensions)

+ (DTXThreadInfo*)threadInfoForThreadNumber:(int64_t)threadNumber inManagedObjectContext:(NSManagedObjectContext*)ctx;

@property (nonatomic, readonly) NSString* friendlyName;

@end
