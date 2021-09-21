//
//  NSFont+UIAdditions.m
//  DetoxInstruments
//
//  Created by Leo Natan on 6/11/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "NSFont+UIAdditions.h"

@implementation NSFont (UIAdditions)

- (NSURL*)fontURL
{
	return [[self fontDescriptor] objectForKey:@"NSCTFontFileURLAttribute"];
}

@end
