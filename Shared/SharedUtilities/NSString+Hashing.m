//
//  NSString+Hashing.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 1/30/19.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import "NSString+Hashing.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Hashing)

- (NSData*)sufficientHash
{
	const char *cStr = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
	
	return [[NSData alloc] initWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

@end
