//
//  DTXActivityBaseDataProvider.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/25/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXActivityBaseDataProvider.h"

@implementation DTXActivityBaseDataProvider

- (void)setEnabledCategories:(NSSet<NSString *> *)enabledCategories
{
	_enabledCategories = enabledCategories.copy;
	
	[self setupContainerProxiesReloadOutline:YES];
}

- (NSPredicate *)predicateForFilter:(NSString *)filter
{
	NSPredicate* rv = [super predicateForFilter:filter];
	
	if(self.enabledCategories != nil)
	{
		rv = [NSCompoundPredicate andPredicateWithSubpredicates:@[rv, [NSPredicate predicateWithFormat:@"category IN %@", _enabledCategories]]];
	}
	
	return rv;
}

@end
