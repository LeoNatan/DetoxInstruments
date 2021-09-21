//
//  DTXPerformanceSample+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/2/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXPerformanceSample+CoreDataClass.h"
@import CoreData;

@interface DTXPerformanceSample (UIExtensions)

@property (nonatomic, copy, readonly) NSArray<NSString*>* dtx_sanitizedOpenFiles;
- (NSString*)heaviestThreadName;

@end
