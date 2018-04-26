//
//  DTXTimelineMouseView.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 07/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "DTXTimelineIndicatorView.h"
#import "NSColor+UIAdditions.h"

@interface DTXTimelineIndicatorView () <CALayerDelegate> @end
@implementation DTXTimelineIndicatorView
{
	NSTrackingArea* _tracker;
}

- (BOOL)canDrawConcurrently
{
	return YES;
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
	self = [super initWithFrame:frameRect];
	
	if(self)
	{
		self.wantsLayer = YES;
		self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
		self.allowedTouchTypes = 0;
		
		_tracker = [[NSTrackingArea alloc] initWithRect:NSZeroRect options:NSTrackingActiveAlways | NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved owner:self userInfo:nil];
		[self addTrackingArea:_tracker];
	}
	
	return self;
}

- (BOOL)isFlipped
{
	return YES;
}

-(void)viewDidChangeBackingProperties
{
	[self setNeedsDisplay:YES];
}

- (BOOL)acceptsFirstResponder
{
	return NO;
}

- (void)layout
{
	[super layout];
	
	[self.layer setNeedsDisplay];
}

- (void)viewDidMoveToWindow
{
	[self viewDidChangeBackingProperties];
}

- (NSView *)hitTest:(NSPoint)aPoint
{
	return nil;
}

- (void)setIndicatorOffset:(CGFloat)indicatorOffset
{
	_indicatorOffset = indicatorOffset;
	
	[self setNeedsDisplay:YES];
}

- (void)setDisplaysIndicator:(BOOL)displaysIndicator
{
	_displaysIndicator = displaysIndicator;
	
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
	if(self.displaysIndicator == NO)
	{
		return;
	}
	
	NSBezierPath* bp = [NSBezierPath bezierPath];
	[bp moveToPoint:NSMakePoint(round(_indicatorOffset), 0)];
	[bp lineToPoint:NSMakePoint(round(_indicatorOffset), self.bounds.size.height)];
	
	bp.lineWidth = 1.0;
	[bp setLineDash:(CGFloat[]){3.,6.} count:2 phase:-1];
	
	[NSColor.textColor set];
	
	[bp stroke];
}

- (void)mouseEntered:(NSEvent *)event
{
	[self mouseMoved:event];
}

- (void)mouseExited:(NSEvent *)event
{
	self.displaysIndicator = NO;
}

- (void)mouseMoved:(NSEvent *)event
{
	CGPoint pointInView = [self convertPoint:[event locationInWindow] fromView:nil];
	
	self.displaysIndicator = pointInView.x >= 210;
	self.indicatorOffset = pointInView.x;
}


- (void)dealloc
{
	[self removeTrackingArea:_tracker];
	_tracker = nil;
}

@end
