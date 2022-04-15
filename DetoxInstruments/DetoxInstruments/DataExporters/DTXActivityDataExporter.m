//
//  DTXActivityDataExporter.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/2/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXActivityDataExporter.h"
#import "DTXActivitySample+UIExtensions.h"

@implementation DTXActivityDataExporter

- (NSFetchRequest *)fetchRequest
{
	NSFetchRequest* fr = [DTXActivitySample fetchRequest];
	fr.predicate = [NSPredicate predicateWithFormat:@"hidden == NO"];
	fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES]];
	
	return fr;
}

- (NSArray<NSString *> *)exportedKeyPaths
{
	return @[@"timestamp", @"endTimestamp", @"duration", @"eventTypeString", @"category", @"name"];
}

- (NSArray<NSString *> *)titles
{
	return @[@"Start Time", @"End Time", @"Duration", @"Type", @"Activity Type", @"Object"];
}

@end
