//
//  DTXSegmentedView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 15/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DTXSegmentedView;

@protocol DTXSegmentedViewDelegate

- (void)segmentedView:(DTXSegmentedView*)segmentedView didSelectSegmentAtIndex:(NSInteger)index;

@end


IBInspectable
@interface DTXSegmentedView : NSSegmentedControl

@property (nonatomic, weak) id<DTXSegmentedViewDelegate> delegate;

- (void)fixIcons;

@end
