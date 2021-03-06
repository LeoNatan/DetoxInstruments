//
//  DTXHighlightingTableCellView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 24/08/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXHighlightingTableCellView.h"

@implementation DTXHighlightingTableCellView

- (void)setBackgroundStyle:(NSBackgroundStyle)backgroundStyle
{
	[super setBackgroundStyle:backgroundStyle];
	
	[self.subviews enumerateObjectsUsingBlock:^(__kindof NSView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if([obj isKindOfClass:[NSControl class]])
		{
			[(NSControl*)obj setHighlighted:backgroundStyle == NSBackgroundStyleDark];
		}
	}];
}

@end
