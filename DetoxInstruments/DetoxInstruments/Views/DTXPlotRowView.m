//
//  DTXPlotRowView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 4/26/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXPlotRowView.h"

@implementation DTXPlotRowView

- (void)drawSelectionInRect:(NSRect)dirtyRect
{
	[self.selectionColor setFill];

	CGContextRef ctx = NSGraphicsContext.currentContext.CGContext;
	CGContextFillRect(ctx, CGRectMake(0, dirtyRect.origin.y, _tableView.tableColumns.firstObject.width, dirtyRect.origin.y + dirtyRect.size.height));
}

- (BOOL)wantsUpdateLayer
{
	return NO;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];

	CGContextRef ctx = NSGraphicsContext.currentContext.CGContext;
	
	[NSColor.separatorColor set];
	CGContextSetLineWidth(ctx, 1);
	CGContextMoveToPoint(ctx, _tableView.tableColumns.firstObject.width, dirtyRect.origin.y);
	CGContextAddLineToPoint(ctx, _tableView.tableColumns.firstObject.width, dirtyRect.origin.y + dirtyRect.size.height);
	CGContextStrokePath(ctx);
	
	CGContextMoveToPoint(ctx, 0, self.bounds.size.height - 0.5);
	CGContextAddLineToPoint(ctx, _tableView.tableColumns.firstObject.width - 0.5, self.bounds.size.height - 0.5);
	CGContextStrokePath(ctx);
	
	CGContextMoveToPoint(ctx, _tableView.tableColumns.firstObject.width + 0.5, self.bounds.size.height - 0.5);
	CGContextAddLineToPoint(ctx, _tableView.bounds.size.width, self.bounds.size.height - 0.5);
	CGContextStrokePath(ctx);
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	
//	self.canDrawSubviewsIntoLayer = YES;
}

@end
