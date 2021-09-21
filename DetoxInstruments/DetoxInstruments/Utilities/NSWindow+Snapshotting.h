//
//  NSWindow+Snapshotting.h
//  DetoxInstruments
//
//  Created by Leo Natan on 5/9/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWindow (Snapshotting)

- (NSImage*)snapshotForCachingDisplay;

@end
