//
//  DTXLiveLogViewController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 8/27/20.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXRemoteTarget.h"
#import "DTXFilterAccessoryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTXLiveLogViewController : NSViewController <DTXFilterAccessoryControllerDelegate>

@property (nonatomic, strong) DTXRemoteTarget* profilingTarget;
@property (nonatomic) BOOL nowMode;

@end

NS_ASSUME_NONNULL_END
