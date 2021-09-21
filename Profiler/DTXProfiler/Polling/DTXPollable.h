//
//  DTXPollable.h
//  DTXProfiler
//
//  Created by Leo Natan on 25/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

@protocol DTXPollable <NSObject>

- (void)pollWithTimePassed:(NSTimeInterval)interval;

@end
