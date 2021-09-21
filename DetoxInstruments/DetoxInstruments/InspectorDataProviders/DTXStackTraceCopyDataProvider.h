//
//  DTXStackTraceCopyDataProvider.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/07/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXInspectorDataProvider.h"

@interface DTXStackTraceCopyDataProvider : DTXInspectorDataProvider

+ (NSFont*)fontForStackTraceDisplay;

- (NSArray*)arrayForStackTrace;
- (NSString*)stackTraceFrameStringForObject:(id)obj includeFullFormat:(BOOL)fullFormat;
- (DTXInspectorContent*)inspectorContentForStackTrace;
- (NSImage*)imageForObject:(id)obj;

@end
