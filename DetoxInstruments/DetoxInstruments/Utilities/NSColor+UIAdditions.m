//
//  NSColor+UIAdditions.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "NSColor+UIAdditions.h"
#import <LNInterpolation/LNInterpolation.h>
#import "NSAppearance+UIAdditions.h"

#define DTX_NAMED_COLOR_IMPL(NAME)	\
+ (NSColor*)NAME	\
{	\
	return [NSColor colorNamed:NSStringFromSelector(_cmd)];	\
}

@implementation NSColor (NamedColors)

DTX_NAMED_COLOR_IMPL(cpuUsagePlotControllerColor)
DTX_NAMED_COLOR_IMPL(memoryUsagePlotControllerColor)
DTX_NAMED_COLOR_IMPL(fpsPlotControllerColor)
DTX_NAMED_COLOR_IMPL(diskReadPlotControllerColor)
DTX_NAMED_COLOR_IMPL(diskWritePlotControllerColor)
DTX_NAMED_COLOR_IMPL(networkRequestsPlotControllerColor)
DTX_NAMED_COLOR_IMPL(signpostPlotControllerColor)
DTX_NAMED_COLOR_IMPL(successColor)
DTX_NAMED_COLOR_IMPL(warningColor)
DTX_NAMED_COLOR_IMPL(warning2Color)
DTX_NAMED_COLOR_IMPL(warning3Color)

+ (NSColor*)signpostPlotControllerColorForCategory:(DTXEventStatusPrivate)eventStatus
{
	switch (eventStatus) {
		case DTXEventStatusPrivateCompleted:
			return NSColor.successColor;
			break;
		case DTXEventStatusPrivateError:
			return NSColor.warning3Color;
			break;
		default:
			return [NSColor colorNamed:[NSString stringWithFormat:@"signpostPlotControllerColor_%@", @(eventStatus)]];
			break;
	}
}

@end

@implementation NSColor (UIAdditions)

- (NSColor*)deeperColorWithAppearance:(NSAppearance*)appearance modifier:(CGFloat)modifier
{
	NSColor* modifierColor = appearance.isDarkAppearance ? NSColor.whiteColor : NSColor.blackColor;
	return [self interpolateToValue:modifierColor progress:modifier];
}

- (NSColor*)shallowerColorWithAppearance:(NSAppearance*)appearance modifier:(CGFloat)modifier
{
	NSColor* modifierColor = appearance.isDarkAppearance ? NSColor.blackColor : NSColor.whiteColor;
	return [self interpolateToValue:modifierColor progress:modifier];
}

+ (NSColor*)randomColorWithSeed:(NSString*)seed;
{
	srand48(seed.hash * 200);
	double r = 1.0 - drand48();

	srand48(seed.hash);
	double g = drand48();

	srand48(seed.hash / 200);
	double b = 1.0 - drand48();

	return [NSColor colorWithRed:r green:g blue:b alpha:1.0];
}

+ (NSColor*)uiColorWithSeed:(NSString*)seed effect:(DTXColorEffect)effect;
{
	CGFloat saturationRange = 0.0;
	CGFloat saturationFloor = 0.65;
	
	CGFloat lightnessRange = 0.0;
	CGFloat lightnessFloor = 0.5;
	
	switch(effect)
	{
		case DTXColorEffectError:
			return NSColor.warning3Color;
		case DTXColorEffectPending:
		case DTXColorEffectCancelled:
			saturationFloor = 0.3;
			if(NSApp.effectiveAppearance.isDarkAppearance)
			{
				lightnessFloor = 0.3;
			}
			else
			{
				lightnessFloor = 0.7;
			}
			break;
		case DTXColorEffectNormal:
			break;
	}
	
	srand48(seed.hash);
	CGFloat h = drand48() * 0.75 + 0.12;
	CGFloat s = drand48() * saturationRange + saturationFloor;
	CGFloat l = drand48() * lightnessRange + lightnessFloor;
	
	//Convert HSL to HSB for API compliance.
	CGFloat t = s * (l < 0.5 ? l : 1 - l);
	CGFloat b = l + t;
	s = l > 0 ? 2 * t / b : 0;
	
	return [NSColor colorWithHue:h saturation:s brightness:b alpha:1.0];
}

@end
