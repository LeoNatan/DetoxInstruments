//
//  DTXSampleDataExporter.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/2/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSampleDataExporter.h"

@implementation DTXSampleDataExporter

- (NSFetchRequest *)fetchRequest
{
	NSFetchRequest* fr = [DTXPerformanceSample fetchRequest];
	fr.predicate = [NSPredicate predicateWithFormat:@"hidden == NO"];
	fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES]];
	
	return fr;
}

@end
