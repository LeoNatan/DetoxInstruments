//
//  DTXNetworkSample+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 29/05/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXNetworkSample+CoreDataClass.h"
@class DTXRecording;

@interface DTXNetworkSample (UIExtensions)

+ (BOOL)hasNetworkSamplesInManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

@end
