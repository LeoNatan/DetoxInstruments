//
//  NSAppearance+UIAdditions.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/26/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "NSAppearance+UIAdditions.h"

@implementation NSAppearance (UIAdditions)

- (BOOL)isDarkAppearance
{
	if (@available(macOS 10.14, *)) {
		NSAppearanceName appearanceName = [self bestMatchFromAppearancesWithNames:@[NSAppearanceNameAqua, NSAppearanceNameDarkAqua]];
		
		return [appearanceName isEqualToString:NSAppearanceNameDarkAqua];
	} else {
		return NO;
	}
}

@end
