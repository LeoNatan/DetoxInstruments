//
//  DTXPlotView-Private.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 1/3/19.
//  Copyright © 2019 Wix. All rights reserved.
//

#import "DTXPlotView.h"

@interface _DTXDrawingZone : NSObject

@property (nonatomic) double start;
@property (nonatomic) NSUInteger drawingType;

@property (nonatomic, weak) _DTXDrawingZone* nextZone;

@end

static inline __attribute__((always_inline)) double lerp(double a, double b, double t)
{
	return a + (b - a) * t;
}

static inline void __DTXFillZones(DTXPlotView* self, NSMutableArray<_DTXDrawingZone*>* zones)
{
	CGFloat graphViewRatio = self.bounds.size.width / self.plotRange.lengthDouble;
	CGFloat offset = - graphViewRatio * self.plotRange.locationDouble;
	
	_DTXDrawingZone* zone = [_DTXDrawingZone new];
	zone.start = offset + graphViewRatio * 0;
	[zones addObject:zone];
	
	for(DTXPlotViewRangeAnnotation* annotation in self.annotations)
	{
		if([annotation isKindOfClass:DTXPlotViewRangeAnnotation.class] == NO)
		{
			continue;
		}
		
		double start = offset + graphViewRatio * annotation.position;
		double end = offset + graphViewRatio * annotation.end;
		
		_DTXDrawingZone* zone;
		if(zones.lastObject.start == start)
		{
			zone = zones.lastObject;
		}
		else
		{
			zone = [_DTXDrawingZone new];
			zone.start = start;
			zones.lastObject.nextZone = zone;
			[zones addObject:zone];
		}
		zone.drawingType = 1;
		
		_DTXDrawingZone* next = [_DTXDrawingZone new];
		zone.nextZone = next;
		next.start = end;
		[zones addObject:next];
	}
}

static inline __attribute__((always_inline)) double __DTXBottomInset(NSEdgeInsets insets, BOOL isFlipped)
{
	return isFlipped == NO ? insets.bottom : insets.top;
}

@interface DTXPlotView ()

- (BOOL)_hasRangeAnnotations;
- (void)_clicked:(NSClickGestureRecognizer*)cgr;

@end
