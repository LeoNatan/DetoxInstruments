//
//  DTXFPSCalculator.h
//  DTXProfiler
//
//  Created by Leo Natan (Wix) on 3/25/18.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPollable.h"
@import UIKit;

@interface DTXFPSCalculator : NSObject <DTXPollable>

@property (nonatomic, assign, readonly) CGFloat fps;

@end
