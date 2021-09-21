//
//  _DTXModalProgressIndicatorController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 4/11/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "_DTXModalProgressIndicatorController.h"

@implementation _DTXModalProgressIndicatorController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.progressIndicator.usesThreadedAnimation = YES;
	[self.progressIndicator startAnimation:nil];
}

@end
