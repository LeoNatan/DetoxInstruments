//
//  NSFormatter+PlotFormatters.h
//  DetoxInstruments
//
//  Created by Leo Natan on 07/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTXSecondsFormatter : NSFormatter

@property (nonatomic) NSUInteger maxMinutesZeroPadding;

@end

@interface DTXMainThreadUsageFormatter : NSFormatter

@end

@interface NSFormatter (PlotFormatters)

+ (NSFormatter*)dtx_stringFormatter;
+ (NSByteCountFormatter*)dtx_memoryFormatter;
+ (NSNumberFormatter*)dtx_percentFormatter;
+ (DTXSecondsFormatter*)dtx_secondsFormatter;
+ (NSFormatter *)dtx_startOfDayDateFormatter;
+ (NSDateComponentsFormatter*)dtx_durationFormatter;
+ (DTXMainThreadUsageFormatter*)dtx_mainThreadFormatter;
+ (NSNumberFormatter*)dtx_readibleCountFormatter;
+ (NSNumberFormatter*)dtx_noFractionDigitsFormatter;

@end
