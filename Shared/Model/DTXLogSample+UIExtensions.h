//
//  DTXLogSample+UIExtensions.h
//  DetoxInstruments
//
//  Created by Leo Natan on 8/26/20.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXLogSample+CoreDataClass.h"
#import "DTXProfilerLogLevel.h"
@import AppKit;

NS_ASSUME_NONNULL_BEGIN

extern NSColor* DTXLogLevelColor(DTXProfilerLogLevel logLevel);
extern NSString* DTXLogLevelDescription(DTXProfilerLogLevel logLevel, BOOL extended);

@interface DTXLogSample (UIExtensions)

- (NSColor*)colorForLogLevel;
- (NSString*)logLevelDescription;

@end

NS_ASSUME_NONNULL_END
