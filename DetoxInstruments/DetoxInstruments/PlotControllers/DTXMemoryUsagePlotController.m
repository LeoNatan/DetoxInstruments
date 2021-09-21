//
//  DTXMemoryUsagePlotController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 04/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXMemoryUsagePlotController.h"
#import "NSFormatter+PlotFormatters.h"
#import "NSColor+UIAdditions.h"
#if ! PROFILER_PREVIEW_EXTENSION
#import "DTXMemoryDataProvider.h"
#endif

@implementation DTXMemoryUsagePlotController

#if ! PROFILER_PREVIEW_EXTENSION
+ (Class)UIDataProviderClass
{
	return [DTXMemoryDataProvider class];
}
#endif

- (NSString *)displayName
{
	return NSLocalizedString(@"Memory Usage", @"");
}

- (NSString *)toolTip
{
	return NSLocalizedString(@"The Memory Usage instrument captures information about the profiled app's memory usage.", @"");
}

- (NSString *)helpTopicName
{
	return @"MemoryUsage";
}

- (NSImage*)displayIcon
{
	return [NSImage imageNamed:@"MemoryUsage"];
}

- (NSArray<NSString*>*)sampleKeys
{
	return @[@"memoryUsage"];
}

- (NSArray<NSString*>*)plotTitles
{
	return @[NSLocalizedString(@"Memory", @"")];
}

- (NSArray<NSColor*>*)plotColors
{
	return @[NSColor.memoryUsagePlotControllerColor];
}

+ (NSFormatter*)formatterForDataPresentation
{
	return [NSFormatter dtx_memoryFormatter];
}

@end
