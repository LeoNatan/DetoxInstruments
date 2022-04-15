//
//  DTXDiskActivityDataExporter.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/2/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXDiskActivityDataExporter.h"

@implementation DTXDiskActivityDataExporter

- (NSArray<NSString *> *)exportedKeyPaths
{
	return @[@"timestamp", @"diskReads", @"diskReadsDelta", @"diskWrites", @"diskWritesDelta"];
}

- (NSArray<NSString *> *)titles
{	
	return @[@"Time", @"Read (Total)", @"Read (Delta)", @"Written (Total)", @"Written (Delta)"];
}

@end
