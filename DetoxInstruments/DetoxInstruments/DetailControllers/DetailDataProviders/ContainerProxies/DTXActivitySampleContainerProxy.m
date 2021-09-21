//
//  DTXActivitySampleContainerProxy.m
//  DetoxInstruments
//
//  Created by Leo Natan on 12/25/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXActivitySampleContainerProxy.h"

@implementation DTXActivitySampleContainerProxy
{
	NSSet<NSString*>* _enabledCategories;
}

- (instancetype)initWithOutlineView:(NSOutlineView *)outlineView managedObjectContext:(NSManagedObjectContext *)managedObjectContext sampleClass:(Class)sampleClass enabledCategories:(NSSet<NSString*>*)enabledCategories
{
	self = [super initWithOutlineView:outlineView managedObjectContext:managedObjectContext sampleClass:sampleClass predicate:nil];
	
	if(self)
	{
		_enabledCategories = enabledCategories;
		
		if(_enabledCategories)
		{
			self.fetchRequest.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[self.fetchRequest.predicate, [NSPredicate predicateWithFormat:@"category IN %@", _enabledCategories]]];
		}
	}
	
	return self;
}

@end
