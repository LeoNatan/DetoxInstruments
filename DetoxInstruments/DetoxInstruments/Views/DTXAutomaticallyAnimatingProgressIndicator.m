//
//  DTXAutomaticallyAnimatingProgressIndicator.m
//  DetoxInstruments
//
//  Created by Leo Natan on 1/15/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXAutomaticallyAnimatingProgressIndicator.h"

@implementation DTXAutomaticallyAnimatingProgressIndicator

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.usesThreadedAnimation = YES;
	[self startAnimation:nil];
}


@end
