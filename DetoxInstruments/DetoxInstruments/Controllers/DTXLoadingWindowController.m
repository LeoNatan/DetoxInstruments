//
//  DTXLoadingWindowController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 1/29/20.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXLoadingWindowController.h"

@implementation DTXLoadingWindowController

- (void)awakeFromNib
{
	[self setLoadingTitle:@"Loading…"];
}

- (void)setLoadingTitle:(NSString *)loadingTitle
{
	_loadingTitle = loadingTitle;
	
	[(NSTextField*)[self.window.contentView viewWithTag:123] setStringValue:_loadingTitle];
}

@end
