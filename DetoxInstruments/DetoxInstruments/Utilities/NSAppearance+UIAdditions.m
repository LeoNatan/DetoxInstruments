//
//  NSAppearance+UIAdditions.m
//  DetoxInstruments
//
//  Created by Leo Natan on 4/26/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "NSAppearance+UIAdditions.h"

@implementation NSAppearance (UIAdditions)

- (BOOL)isDarkAppearance
{
	if([self.name isEqualToString:@"NSAppearanceNameFunctionRow"])
	{
		return YES;
	}
	
	NSAppearanceName appearanceName = [self bestMatchFromAppearancesWithNames:@[NSAppearanceNameAqua, NSAppearanceNameDarkAqua]];
	
	return [appearanceName isEqualToString:NSAppearanceNameDarkAqua];
}

- (BOOL)isTouchBarAppearance
{
	if([self.name isEqualToString:@"NSAppearanceNameFunctionRow"])
	{
		return YES;
	}
	
	return NO;
}

- (void)performBlockAsCurrentAppearance:(void(^)(void))block
{
	NSAppearance* current = NSAppearance.currentAppearance;
	NSAppearance.currentAppearance = self;
	block();
	NSAppearance.currentAppearance = current;
}

@end
