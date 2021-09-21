//
//  NSString+Hashing.h
//  DetoxInstruments
//
//  Created by Leo Natan on 1/30/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

@property (nonatomic, copy, readonly) NSData* sufficientHash;

@end
