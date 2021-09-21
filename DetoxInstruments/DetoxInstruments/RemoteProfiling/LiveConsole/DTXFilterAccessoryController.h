//
//  DTXFilterAccessoryController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 8/30/20.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DTXFilterAccessoryControllerDelegate <NSObject>

- (void)allProcesses:(BOOL)allProcesses;

- (void)includeApple:(BOOL)includeApple;

- (void)allMessages:(BOOL)allMessages;

@end

@interface DTXFilterAccessoryController : NSTitlebarAccessoryViewController

@property (nonatomic, weak) id<DTXFilterAccessoryControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
