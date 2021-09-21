//
//  DTXScrollView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 11/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXScrollView : NSScrollView

@property (nonatomic, strong, readonly) NSScroller* customHorizontalScroller;
- (void)setHorizontalScrollerKnobProportion:(CGFloat)proportion value:(CGFloat)value;

@end
