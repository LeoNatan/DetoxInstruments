//
//  DTXOutlineDetailController.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/24/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "DTXOutlineDetailController.h"

@implementation DTXOutlineDetailController
{
	IBOutlet NSOutlineView* _outlineView;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.wantsLayer = YES;
	self.view.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
	_outlineView.wantsLayer = YES;
	_outlineView.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
}

- (NSString *)displayName
{
	return NSLocalizedString(@"Samples", @"");
}

- (NSImage *)smallDisplayIcon
{
	NSImage* image = [NSImage imageNamed:@"samples"];
	image.size = NSMakeSize(16, 16);
	
	return image;
}

- (void)setDetailDataProvider:(DTXDetailDataProvider *)detailDataProvider
{
	super.detailDataProvider = detailDataProvider;
}

- (void)viewWillAppear
{
	[super viewWillAppear];
	
	self.detailDataProvider.managedOutlineView = _outlineView;
}

- (void)viewWillDisappear
{
	[super viewWillDisappear];
	
	self.detailDataProvider.managedOutlineView = nil;
}

- (void)viewDidLayout
{
	[super viewDidLayout];
	
	if(_outlineView.tableColumns.lastObject.resizingMask != NSTableColumnAutoresizingMask)
	{
		return;
	}
	
	[_outlineView sizeLastColumnToFit];
}

- (void)updateViewWithInsets:(NSEdgeInsets)insets
{
	_outlineView.enclosingScrollView.contentInsets = insets;
}

- (NSView *)viewForCopy
{
	return _outlineView;
}

@end
