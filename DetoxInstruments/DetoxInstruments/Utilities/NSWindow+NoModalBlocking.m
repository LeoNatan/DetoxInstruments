//
//  NSWindow+NoModalBlocking.m
//  DetoxInstruments
//
//  Created by Leo Natan on 9/20/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "NSWindow+NoModalBlocking.h"
@import ObjectiveC;

@implementation NSWindow (NoModalBlocking)

+ (void)load
{
	@autoreleasepool
	{
		SEL methodSel = NSSelectorFromString(@"_blocksActionWhenModal:");
		Method m = class_getInstanceMethod(NSWindow.class, methodSel);
		if(m == NULL)
		{
			return;
		}
		
		BOOL (*orig)(id, SEL, SEL) = (void*)method_getImplementation(m);
		method_setImplementation(m, imp_implementationWithBlock(^ (NSWindow* _self, SEL action) {
			if(action != @selector(terminate:))
			{
				return orig(_self, methodSel, action);
			}
			
			NSString* className = NSStringFromClass(_self.contentViewController.class);
			if([className hasPrefix:@"DTX"] || [className hasPrefix:@"_DTX"])
			{
				return NO;
			}
			
			return orig(_self, methodSel, action);
		}));
	}
}

@end
