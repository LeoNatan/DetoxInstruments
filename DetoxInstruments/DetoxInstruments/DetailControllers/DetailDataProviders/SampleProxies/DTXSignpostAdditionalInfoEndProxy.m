//
//  DTXSignpostAdditionalInfoEndProxy.m
//  DetoxInstruments
//
//  Created by Leo Natan on 2/5/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXSignpostAdditionalInfoEndProxy.h"

@implementation DTXSignpostAdditionalInfoEndProxy

@dynamic additionalInfoEnd;

- (instancetype)initWithSignpostSample:(DTXSignpostSample *)sample
{
	self = [super init];
	
	if(self)
	{
		_sample = sample;
	}
	
	return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
	return [self respondsToSelector:aSelector] || [_sample respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
	return _sample;
}

@end
