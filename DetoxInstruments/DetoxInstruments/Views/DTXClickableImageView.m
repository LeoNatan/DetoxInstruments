//
//  DTXClickableImageView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 11/18/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXClickableImageView.h"

@implementation DTXClickableImageView
{
	NSTrackingArea* _trackingArea;
}

- (void)mouseEntered:(NSEvent *)event
{
	[super mouseEntered:event];
	[NSCursor.pointingHandCursor set];
}

- (void)mouseExited:(NSEvent *)event
{
	[super mouseExited:event];
	[NSCursor.arrowCursor set];
}

-(void)updateTrackingAreas
{
	[super updateTrackingAreas];
	if(_trackingArea != nil)
	{
		[self removeTrackingArea:_trackingArea];
	}
	
	int opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
	_trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:opts owner:self userInfo:nil];
	[self addTrackingArea:_trackingArea];
}

@end
