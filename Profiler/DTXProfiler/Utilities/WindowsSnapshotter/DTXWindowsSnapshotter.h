//
//  DTXWindowsSnapshotter.h
//  DTXProfiler
//
//  Created by Leo Natan on 11/13/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTXWindowsSnapshotter : NSObject

+ (NSData*)snapshotDataForApp;

@end

NS_ASSUME_NONNULL_END
