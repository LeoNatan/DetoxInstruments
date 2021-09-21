//
//  NSImage+UIAdditions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/14/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (UIAdditions)

+ (NSImage*)imageWithColor:(NSColor*)color size:(NSSize)size;
- (NSImage *)imageTintedWithColor:(NSColor *)tint;

@end
