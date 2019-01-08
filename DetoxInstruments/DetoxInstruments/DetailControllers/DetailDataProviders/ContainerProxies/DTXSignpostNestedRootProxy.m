//
//  DTXSignpostNestedRootProxy.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/7/18.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import "DTXSignpostNestedRootProxy.h"
#import "DTXSignpostSampleWithChildrenProxy.h"

@implementation DTXSignpostNestedRootProxy
{
	NSArray<DTXSignpostSampleWithChildrenProxy*>* _rootChildren;
}

- (void)prepareData
{
	[super prepareData];
	
	_rootChildren = [DTXSignpostSampleWithChildrenProxy sortedSamplesFromFetchedResultsController:self.fetchedResultsController];
}

- (NSUInteger)samplesCount
{
	return _rootChildren.count;
}

- (id)sampleAtIndex:(NSUInteger)index;
{
	return _rootChildren[index];
}

@end
