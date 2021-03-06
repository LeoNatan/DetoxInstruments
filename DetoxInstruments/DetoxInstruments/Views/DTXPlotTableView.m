//
//  DTXPlotTableView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 02/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXPlotTableView.h"
#if ! PROFILER_PREVIEW_EXTENSION
#import "DTXGraphHostingView.h"
#endif

@interface _DTXEventWrapper : NSObject @end
@implementation _DTXEventWrapper
{
	NSEvent* _obj;
	NSView* _view;
}

- (instancetype)initWithEvent:(NSEvent*)event fakedCoordsOfView:(NSView*)view
{
	self = [super init];
	if(self)
	{
		_obj = event;
		_view = view;
	}
	return self;
}

- (NSPoint)locationInWindow
{
	NSPoint pt = [_obj locationInWindow];
	NSRect frameInWin = [_view convertRect:_view.bounds toView:nil];
	
	pt.y = frameInWin.origin.y + 1;
	if(pt.x < frameInWin.origin.x)
	{
		pt.x = frameInWin.origin.x;
	}
	
	return pt;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
	return [_obj methodSignatureForSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
	return _obj;
}

@end

@implementation DTXPlotTableView
{
	BOOL _ignoresEvents;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.wantsLayer = YES;
	self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
	if (@available(macOS 11.0, *)) {
		self.style = NSTableViewStyleFullWidth;
		[[self valueForKey:@"styleData"] setValue:@0 forKey:@"rowContentPadding"];
	}
}

- (NSRect)frameOfOutlineCellAtRow:(NSInteger)row
{
	NSRect frame = [super frameOfOutlineCellAtRow:row];
	
	if(CGRectEqualToRect(frame, NSZeroRect))
	{
		return frame;
	}
	
	frame.origin.x = 5;
	return frame;
}

- (void)drawGridInClipRect:(NSRect)clipRect
{
//	NSRect lastRowRect = [self rectOfRow:[self numberOfRows] - 1];
//	NSRect myClipRect = NSMakeRect(0, 0, lastRowRect.size.width, NSMaxY(lastRowRect));
//	NSRect finalClipRect = NSIntersectionRect(clipRect, myClipRect);
//	[super drawGridInClipRect:finalClipRect];
}

-(void)mouseDown:(nonnull NSEvent *)event
{
#if ! PROFILER_PREVIEW_EXTENSION
	if([[self hitTest:[self convertPoint:[event locationInWindow] fromView:nil]] isKindOfClass:[DTXGraphHostingView class]])
	{
		return;
	}
#endif
	
	[super mouseDown:event];
}

-(void)magnifyWithEvent:(nonnull NSEvent *)event
{
	if(_ignoresEvents)
	{
		return;
	}
	
	if(self.numberOfRows == 0)
	{
		return;
	}
	
	_ignoresEvents = YES;
	NSTableRowView* rowView = [self rowViewAtRow:0 makeIfNecessary:NO];
	NSView* actualView = [[[rowView viewAtColumn:rowView.numberOfColumns - 1] subviews] lastObject];
	
	[actualView magnifyWithEvent:(id)[[_DTXEventWrapper alloc] initWithEvent:event fakedCoordsOfView:actualView]];
	_ignoresEvents = NO;
}

- (void)scrollWheel:(NSEvent *)event
{
	if(_ignoresEvents)
	{
		return;
	}
	
	_ignoresEvents = YES;
	if(fabs(event.scrollingDeltaY) >= fabs(event.scrollingDeltaX))
	{
		[super scrollWheel:event];
		_ignoresEvents = NO;
		return;
	}
	
	NSTableRowView* rowView = [self rowViewAtRow:0 makeIfNecessary:NO];
	NSView* actualView = [[[rowView viewAtColumn:rowView.numberOfColumns - 1] subviews] lastObject];
	
	[actualView scrollWheel:(id)[[_DTXEventWrapper alloc] initWithEvent:event fakedCoordsOfView:actualView]];
	_ignoresEvents = NO;
}

+ (BOOL)isCompatibleWithResponsiveScrolling
{
	return YES;
}

- (BOOL)validateProposedFirstResponder:(NSResponder *)responder forEvent:(NSEvent *)event
{
	// This allows the user to click on controls within a cell withough first having to select the cell row
	return YES;
}

@end
