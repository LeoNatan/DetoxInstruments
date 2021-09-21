//
//  DTXRemoteProfilingSelectionOutlineView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 11/18/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXRemoteProfilingSelectionOutlineView.h"
#import "DTXClickableImageView.h"

@implementation DTXRemoteProfilingSelectionOutlineView

-(BOOL)validateProposedFirstResponder:(NSResponder *)responder forEvent:(NSEvent *)event
{
	if([responder isKindOfClass:DTXClickableImageView.class])
	{
		return YES;
	}
	
	return [super validateProposedFirstResponder:responder forEvent:event];
}

@end
