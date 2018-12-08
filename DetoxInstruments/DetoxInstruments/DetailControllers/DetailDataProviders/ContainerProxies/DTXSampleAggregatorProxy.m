//
//  DTXSampleAggregatorProxy.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 7/2/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "DTXSampleAggregatorProxy.h"

@implementation DTXSampleAggregatorProxy
{
	NSMutableArray<NSString*>* _aggregates;
	NSMapTable<NSString*, DTXSampleContainerProxy*>* _proxyMapping;
}

- (instancetype)initWithKeyPath:(NSString*)keyPath outlineView:(NSOutlineView*)outlineView managedObjectContext:(NSManagedObjectContext*)managedObjectContext isRoot:(BOOL)root
{
	self = [super initWithOutlineView:outlineView managedObjectContext:managedObjectContext isRoot:root];
	
	if(self)
	{
		_keyPath = keyPath;
	}
	
	return self;
}

- (void)prepareData
{
	[super prepareData];
	
	_aggregates = [self.fetchedResultsController.fetchedObjects valueForKey:self.keyPath];
	_proxyMapping = [NSMapTable strongToStrongObjectsMapTable];
	
	[_aggregates enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		_proxyMapping[obj] = [self objectForSample:obj];
	}];
	
	[super prepareData];
}

- (NSFetchRequest *)fetchRequest
{
	return [self _fetchRequestForAggregatesWithDictionaryResult:YES];
}

- (NSFetchRequest*)_fetchRequestForAggregatesWithDictionaryResult:(BOOL)dictionaryResult
{
	NSFetchRequest* fr = [self.sampleClass fetchRequest];
	
	if(dictionaryResult)
	{
		NSExpression *nameExpression = [NSExpression expressionForKeyPath:self.keyPath];
		NSExpressionDescription *nameDescription = [NSExpressionDescription new];
		nameDescription.expression = nameExpression;
		nameDescription.name = self.keyPath;
		nameDescription.expressionResultType = NSStringAttributeType;
		
		fr.propertiesToFetch = @[nameDescription];
		fr.propertiesToGroupBy = @[self.keyPath];
		fr.resultType = NSDictionaryResultType;
	}
	
	fr.predicate = self.predicateForAggregator;
	fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES]];
	
	return fr;
}

- (void)handleSampleInserts:(NSArray *)inserts updates:(NSArray *)updates shouldReloadProxy:(BOOL *)reloadProxy
{}

- (NSUInteger)samplesCount
{
	return _aggregates.count;
}

- (id)sampleAtIndex:(NSUInteger)index
{
	return _proxyMapping[_aggregates[index]];
}


@end
