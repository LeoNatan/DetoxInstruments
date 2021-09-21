//
//  DTXAutomaticallyDeselectingOutlineView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 24/08/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXAutomaticallyDeselectingOutlineView.h"

@implementation DTXAutomaticallyDeselectingOutlineView

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	if (@available(macOS 11.0, *))
	{
		self.style = NSTableViewStyleFullWidth;
	}
}

- (BOOL)resignFirstResponder
{
	[self deselectAll:nil];
	
	return [super resignFirstResponder];
}


@end
