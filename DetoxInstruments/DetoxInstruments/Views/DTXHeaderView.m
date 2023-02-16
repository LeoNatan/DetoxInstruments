//
//  DTXHeaderView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 07/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXHeaderView.h"
#import "NSColor+UIAdditions.h"

@implementation DTXHeaderView

- (BOOL)canDrawConcurrently
{
	return YES;
}

- (BOOL)allowsVibrancy
{
	return YES;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.wantsLayer = YES;
}

- (void)viewDidMoveToWindow
{
	[super viewDidMoveToWindow];
	
	[self viewDidChangeBackingProperties];
}

-(void)viewDidChangeBackingProperties
{
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
	
	if(@available(macOS 11.0, *))
	{
		[NSColor.gridColor set];
	}
	else
	{
		[NSColor.secondaryLabelColor set];
	}
	
	NSBezierPath* line = [NSBezierPath bezierPath];

//	[line moveToPoint:NSMakePoint(0, 0.5)];
//	[line lineToPoint:NSMakePoint(self.bounds.size.width, 0.5)];
	
	[line moveToPoint:NSMakePoint(_tableView.tableColumns.firstObject.width, 0)];
	[line lineToPoint:NSMakePoint(_tableView.tableColumns.firstObject.width, self.bounds.size.height)];
	
	line.lineWidth = 1;
	[line stroke];
}

@end
