//
//  DTXShortDateValueTransformer.m
//  DetoxInstruments
//
//  Created by Leo Natan on 8/28/20.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXShortDateValueTransformer.h"
#import "NSFormatter+PlotFormatters.h"

@implementation DTXShortDateValueTransformer

- (nullable id)transformedValue:(NSDate*)value
{
	if(value == nil)
	{
		return nil;
	}
	
	return [NSFormatter.dtx_startOfDayDateFormatter stringForObjectValue:@([value timeIntervalSinceDate:[NSCalendar.currentCalendar startOfDayForDate:value]])];
}

@end
