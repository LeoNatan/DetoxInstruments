//
//  DTXPerformanceSample+UIExtensions.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 29/05/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "DTXPerformanceSample+UIExtensions.h"
#import "DTXInstrumentsModelUIExtensions.h"

static NSNumberFormatter* __percentFormatter;
NSByteCountFormatter* __byteFormatter;

@implementation DTXPerformanceSample (UIExtensions)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__percentFormatter = [NSNumberFormatter new];
		__percentFormatter.numberStyle = NSNumberFormatterPercentStyle;
		
		__byteFormatter = [NSByteCountFormatter new];
		__byteFormatter.countStyle = NSByteCountFormatterCountStyleMemory;
	});
}

- (NSString *)descriptionForUI
{
	return [NSString stringWithFormat:@"%@: %2lf %@: %@ %@: %@ %@: %@, %@: %@", NSLocalizedString(@"FPS", @""), self.fps, NSLocalizedString(@"CPU", @""), [__percentFormatter stringFromNumber:@(self.cpuUsage / 100.0)], NSLocalizedString(@"Memory", @""), [__byteFormatter stringFromByteCount:self.memoryUsage], NSLocalizedString(@"Disk Read", @""), [__byteFormatter stringFromByteCount:self.diskReads], NSLocalizedString(@"Disk Written", @""), [__byteFormatter stringFromByteCount:self.diskWrites]];
}

@end
