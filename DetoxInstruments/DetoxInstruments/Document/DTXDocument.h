//
//  DTXDocument.h
//  DetoxInstruments
//
//  Created by Leo Natan on 8/26/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXDocument : NSDocument

- (id)objectForPreferenceKey:(NSString*)key;
- (void)setObject:(id)object forPreferenceKey:(NSString*)key;

@end
