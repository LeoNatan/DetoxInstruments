//
//  DTXFPSDataExporter.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/2/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXFPSDataExporter.h"

@implementation DTXFPSDataExporter

- (NSArray<NSString *> *)exportedKeyPaths
{
	return @[@"timestamp", @"fps"];
}

- (NSArray<NSString *> *)titles
{
	return @[@"Time", @"FPS"];
}

@end
