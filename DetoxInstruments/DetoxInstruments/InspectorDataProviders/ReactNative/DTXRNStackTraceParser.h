//
//  DTXRNStackTraceParser.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 7/29/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTXRNStackTraceParser : NSObject

+ (NSString*)stackTraceFrameStringForObject:(id)obj includeFullFormat:(BOOL)fullFormat;

@end

NS_ASSUME_NONNULL_END
