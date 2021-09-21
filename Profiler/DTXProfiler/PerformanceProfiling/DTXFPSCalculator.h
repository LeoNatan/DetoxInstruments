//
//  DTXFPSCalculator.h
//  DTXProfiler
//
//  Created by Leo Natan on 3/25/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPollable.h"
@import UIKit;

@interface DTXFPSCalculator : NSObject <DTXPollable>

@property (nonatomic, assign, readonly) CGFloat fps;

- (void)stop;

@end
