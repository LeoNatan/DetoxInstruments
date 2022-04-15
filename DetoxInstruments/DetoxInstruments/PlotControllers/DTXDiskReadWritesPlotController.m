//
//  DTXDiskReadWritesPlotController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 04/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXDiskReadWritesPlotController.h"
#import "NSFormatter+PlotFormatters.h"
#import "NSColor+UIAdditions.h"
#if ! PROFILER_PREVIEW_EXTENSION
#import "DTXDiskDataProvider.h"
#endif

@implementation DTXDiskReadWritesPlotController

#if ! PROFILER_PREVIEW_EXTENSION
+ (Class)UIDataProviderClass
{
	return [DTXDiskDataProvider class];
}
#endif

- (NSString *)displayName
{
	return NSLocalizedString(@"Disk Activity", @"");
}

- (NSString *)toolTip
{
	return NSLocalizedString(@"The Disk Activity instrument captures information about the profiled app's disk reads and writes.", @"");
}

- (NSString *)helpTopicName
{
	return @"DiskActivity";
}

- (NSImage*)displayIcon
{
	return [NSImage imageNamed:@"DiskActivity"];
}

- (NSArray<NSString*>*)sampleKeys
{
	return @[@"diskReadsDelta", @"diskWritesDelta"];
}

- (NSArray<NSColor*>*)plotColors
{
	return @[NSColor.diskReadPlotControllerColor, NSColor.diskWritePlotControllerColor];
}

- (NSArray<NSString*>*)plotTitles
{
	return @[NSLocalizedString(@"Reads", @""), NSLocalizedString(@"Writes", @"")];
}

- (BOOL)isStepped
{
	return YES;
}

+ (NSFormatter*)formatterForDataPresentation
{
	return [NSFormatter dtx_memoryFormatter];
}

- (BOOL)includeSeparatorsInStackView
{
	return self.isForTouchBar;
}

@end
