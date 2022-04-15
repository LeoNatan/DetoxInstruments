//
//  DTXHeaderAccessoryViewController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 9/2/20.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTXHeaderAccessoryViewController : NSTitlebarAccessoryViewController

@property (nonatomic, readonly) DTXHeaderView* headerView;

@end

NS_ASSUME_NONNULL_END
