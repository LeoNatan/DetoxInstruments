//
//  DTXBox.m
//  DetoxInstruments
//
//  Created by Leo Natan on 8/3/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXBox.h"

@implementation DTXBox

- (BOOL)wantsUpdateLayer
{
	return YES;
}

- (void)updateLayer
{
	[super updateLayer];
	
	self.layer.cornerRadius = self.cornerRadius;
}

@end
