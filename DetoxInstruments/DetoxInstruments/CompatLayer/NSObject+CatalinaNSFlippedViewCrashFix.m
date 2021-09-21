//
//  NSObject+CatalinaNSFlippedViewCrashFix.m
//  DetoxInstruments
//
//  Created by Leo Natan on 9/2/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "NSObject+CatalinaNSFlippedViewCrashFix.h"
#import <AppKit/AppKit.h>
@import ObjectiveC;

#import "LNLogging.h"
LN_CREATE_LOG(CatalinaNSFlippedViewCrashFix)

@interface NSObject ()

- (void)drawAtPoint:(CGPoint)arg1 inContext:(CGContextRef)arg2;

@end

@implementation NSObject (CatalinaNSFlippedViewCrashFix)

+ (void)load
{
	@autoreleasepool
	{
//		{
//			Method m = class_getInstanceMethod(NSClassFromString(@"NSTableViewStyleData"), NSSelectorFromString(@"rowContentPadding"));
//			method_setImplementation(m, imp_implementationWithBlock(^ {
//				return 0;
//			}));
//			
//			unsigned int cnt = 0;
//			Method* list = class_copyMethodList(NSClassFromString(@"NSTableViewStyleData"), &cnt);
//			for (unsigned int idx = 0; idx < cnt; idx++) {
//				NSLog(@"%@", NSStringFromSelector(method_getName(list[idx])));
//			}
//		}
		
		Method m = class_getInstanceMethod(NSClassFromString(@"NSLineFragmentRenderingContext"), @selector(drawAtPoint:inContext:));
		void (*orig)(id, SEL, CGPoint, CGContextRef) = (void*)method_getImplementation(m);
		method_setImplementation(m, imp_implementationWithBlock(^ (id _self, CGPoint point, CGContextRef ctx) {
			@try {
				orig(_self, @selector(drawAtPoint:inContext:), point, ctx);
			} @catch (NSException *exception) {
				ln_log_error(@"Catalina bug: lockFocus");
			}
		}));
	}
}

@end
