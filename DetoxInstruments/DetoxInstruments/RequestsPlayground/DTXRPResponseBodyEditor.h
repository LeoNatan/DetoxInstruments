//
//  DTXRPResponseBodyEditor.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/10/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXRPResponseBodyEditor : NSViewController

- (void)setBody:(NSData *)body response:(NSURLResponse*)response error:(NSError*)error metrics:(NSURLSessionTaskMetrics*)metrics;

@end
