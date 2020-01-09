//
//  DTXActivityFlatDataProvider.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/5/18.
//  Copyright © 2017-2020 Wix. All rights reserved.
//

#import "DTXActivityFlatDataProvider.h"
#import "DTXSignpostSummaryRootProxy.h"
#import "DTXSignpostProtocol.h"
#import "DTXDetailOutlineView.h"
#import "DTXActivitySampleContainerProxy.h"
#import "DTXActivitySample+UIExtensions.h"
#import "DTXSignpostDataExporter.h"
#import "DTXSignpostEntitySampleContainerProxy.h"
#import "DTXEventInspectorDataProvider.h"

@implementation DTXActivityFlatDataProvider

+ (Class)inspectorDataProviderClass
{
	return [DTXEventInspectorDataProvider class];
}

- (Class)dataExporterClass
{
	return DTXSignpostDataExporter.class;
}

- (NSString *)identifier
{
	return @"List";
}

- (NSString *)displayName
{
	return NSLocalizedString(@"List", @"");;
}

- (void)setManagedOutlineView:(NSOutlineView *)managedOutlineView
{
	[self _enableOutlineRespectIfNeededForOutlineView:managedOutlineView];
	
	[super setManagedOutlineView:managedOutlineView];
}

- (void)_enableOutlineRespectIfNeededForOutlineView:(NSOutlineView*)outlineView
{
	if([outlineView respondsToSelector:@selector(setRespectsOutlineCellFraming:)])
	{
		[(DTXDetailOutlineView*)outlineView setRespectsOutlineCellFraming:NO];
	}
}

- (NSArray<DTXColumnInformation *> *)columns
{
	const CGFloat durationMinWidth = 90;
	
	DTXColumnInformation* start = [DTXColumnInformation new];
	start.title = NSLocalizedString(@"Start", @"");
	start.minWidth = 80;
	start.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES];
	
	DTXColumnInformation* duration = [DTXColumnInformation new];
	duration.title = NSLocalizedString(@"Duration", @"");
	duration.minWidth = durationMinWidth;
	duration.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"duration" ascending:YES];
	
	DTXColumnInformation* category = [DTXColumnInformation new];
	category.title = NSLocalizedString(@"Activity Type", @"");
	category.minWidth = 165;
	category.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"category" ascending:YES];
	
	DTXColumnInformation* name = [DTXColumnInformation new];
	name.title = NSLocalizedString(@"Object", @"");
	name.minWidth = 200;
	name.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
	
	return @[start, duration, category, name];
}

- (Class)sampleClass
{
	return DTXSignpostSample.class;
}

- (NSString*)formattedStringValueForItem:(id)item column:(NSUInteger)column
{
	DTXSignpostSample* signpostSample = item;
	
	switch(column)
	{
		case 0:
		{
			NSTimeInterval ti = signpostSample.timestamp.timeIntervalSinceReferenceDate - self.document.firstRecording.startTimestamp.timeIntervalSinceReferenceDate;
			return [[NSFormatter dtx_secondsFormatter] stringForObjectValue:@(ti)];
		}
		case 1:
			if(signpostSample.isEvent || signpostSample.endTimestamp == nil)
			{
				return @" ";
			}
			return [[NSFormatter dtx_durationFormatter] stringFromTimeInterval:signpostSample.duration];
		case 2:
			return signpostSample.category;
		case 3:
			return signpostSample.name;
		default:
			return nil;
	}
}

- (NSColor *)backgroundRowColorForItem:(id)item
{
	DTXSignpostSample* sample = item;
	
	if(sample.eventStatus == DTXEventStatusPrivateError)
	{
		return NSColor.warning3Color;
	}
	
	if(sample.isExpandable == NO && sample.endTimestamp == nil)
	{
		return NSColor.warningColor;
	}
	
	return sample.plotControllerColor;
}

- (BOOL)supportsDataFiltering
{
	return YES;
}

- (BOOL)showsTimestampColumn
{
	return NO;
}

- (NSArray<NSString *> *)filteredAttributes
{
	return @[@"category", @"name", @"additionalInfoStart", @"additionalInfoEnd"];
}

- (DTXSampleContainerProxy *)rootSampleContainerProxy
{
	return [[DTXActivitySampleContainerProxy alloc] initWithOutlineView:self.managedOutlineView managedObjectContext:self.document.viewContext sampleClass:self.sampleClass enabledCategories:self.enabledCategories];
}

@end
