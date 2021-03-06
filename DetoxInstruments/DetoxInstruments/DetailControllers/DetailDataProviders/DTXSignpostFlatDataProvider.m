//
//  DTXSignpostFlatDataProvider.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/5/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSignpostFlatDataProvider.h"
#import "DTXSignpostSummaryRootProxy.h"
#import "DTXSignpostProtocol.h"
#import "DTXDetailOutlineView.h"
#import "DTXEventInspectorDataProvider.h"
#import "DTXSignpostSample+UIExtensions.h"
#import "DTXSignpostDataExporter.h"
#import "DTXSignpostEntitySampleContainerProxy.h"

@implementation DTXSignpostFlatDataProvider

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
	
	DTXColumnInformation* type = [DTXColumnInformation new];
	type.title = NSLocalizedString(@"Type", @"");
	type.minWidth = 80;
	type.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"isEvent" ascending:YES];
	
	DTXColumnInformation* category = [DTXColumnInformation new];
	category.title = NSLocalizedString(@"Category", @"");
	category.minWidth = 165;
	category.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"category" ascending:YES];
	
	DTXColumnInformation* name = [DTXColumnInformation new];
	name.title = NSLocalizedString(@"Name", @"");
	name.minWidth = 200;
	name.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
	
	DTXColumnInformation* status = [DTXColumnInformation new];
	status.title = NSLocalizedString(@"Status", @"");
	status.minWidth = 100;
	status.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"eventStatus" ascending:YES];
	
	DTXColumnInformation* moreInfo1 = [DTXColumnInformation new];
	moreInfo1.title = NSLocalizedString(@"Start Message", @"");
	moreInfo1.minWidth = 200;
	moreInfo1.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"additionalInfoStart" ascending:YES];
	
	DTXColumnInformation* moreInfo2 = [DTXColumnInformation new];
	moreInfo2.title = NSLocalizedString(@"End Message", @"");
	moreInfo2.minWidth = 200;
	moreInfo2.sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"additionalInfoEnd" ascending:YES];
	
	return @[start, duration, type, status, category, name, moreInfo1, moreInfo2];
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
			return signpostSample.eventTypeString;
		case 3:
			return signpostSample.eventStatusString;
		case 4:
			return signpostSample.category;
		case 5:
			return signpostSample.name;
		case 6:
			return signpostSample.additionalInfoStart;
		case 7:
			return signpostSample.additionalInfoEnd;
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

- (NSString*)statusTooltipforItem:(id)item
{
	DTXSignpostSample* sample = item;
	
	if(sample.eventStatus == DTXEventStatusPrivateError)
	{
		return NSLocalizedString(@"Event error", @"");
	}
	
	if(sample.isExpandable == NO && sample.endTimestamp == nil)
	{
		return NSLocalizedString(@"Incomplete event", @"");
	}
	
	return nil;
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
	return [[DTXSignpostEntitySampleContainerProxy alloc] initWithOutlineView:self.managedOutlineView managedObjectContext:self.document.viewContext sampleClass:self.sampleClass];
}

@end
