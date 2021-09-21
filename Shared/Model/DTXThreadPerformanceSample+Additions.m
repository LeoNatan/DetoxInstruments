//
//  DTXThreadPerformanceSample+Additions.m
//  DTXProfiler
//
//  Created by Leo Natan on 1/9/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXThreadPerformanceSample+Additions.h"
#import "DTXSample+Additions.h"

@implementation DTXThreadPerformanceSample (Additions)

- (void)awakeFromInsert
{
	[super awakeFromInsert];
	
	self.timestamp = [NSDate date];
	self.sampleType = [DTXSample sampleTypeFromClass:self.class];
}

@end
