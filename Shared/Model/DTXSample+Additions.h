//
//  DTXSample+Additions.h
//  DTXProfiler
//
//  Created by Leo Natan on 18/05/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXSample+CoreDataClass.h"
#import "DTXRecording+Additions.h"

@import Foundation;

typedef NS_ENUM(NSUInteger, DTXSampleType) {
	DTXSampleTypeUnknown				        	= 0,
	
	DTXSampleTypePerformance			        	= 11,
	DTXSampleTypeThreadPerformance		        	= 12,
	
	DTXSampleTypeNetwork				        	= 50,
	
	DTXSampleTypeSignpost				        	= 70,
	DTXSampleTypeActivity				        	= 71,
	
	DTXSampleTypeLog					        	= 100,
	
	DTXSampleTypeTag					        	= 200,
	DTXSampleTypeGroup					        	= 1000,
	
	DTXSampleTypeUser					        	= 20000,
	
	DTXSampleTypeDetoxLifecycle						= 30000,
};

@interface DTXSample (Additions)

+ (Class)classFromSampleType:(DTXSampleType)type;
+ (DTXSampleType)sampleTypeFromClass:(Class)cls;

@end
