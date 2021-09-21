//
//  NSKeyedUnarchiver+QuickDecodingSecureCoding.m
//  DTXProfiler
//
//  Created by Leo Natan on 11/13/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "NSKeyedUnarchiver+QuickDecodingSecureCoding.h"

@implementation NSKeyedUnarchiver (QuickDecodingSecureCoding)

+ (nullable id)dtx_unarchiveObjectWithData:(NSData *)data requiringSecureCoding:(BOOL)requiresSecureCoding error:(NSError **)error
{
	NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc] initForReadingFromData:data error:error];
	unarchiver.requiresSecureCoding = requiresSecureCoding;
	return [unarchiver decodeObjectForKey:NSKeyedArchiveRootObjectKey];
}

@end
