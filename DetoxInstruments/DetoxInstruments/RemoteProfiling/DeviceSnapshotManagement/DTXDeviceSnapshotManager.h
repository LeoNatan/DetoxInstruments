//
//  DTXDeviceSnapshotManager.h
//  DetoxInstruments
//
//  Created by Leo Natan on 11/17/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

@import AppKit;

NS_ASSUME_NONNULL_BEGIN

@interface DTXDeviceSnapshotManager : NSObject

- (instancetype)initWithDeviceImageView:(NSImageView*)deviceImageView snapshotImageView:(NSImageView*)snapshotImageView;

- (void)clearDevice;
- (void)setMachineName:(NSString*)machineName resolution:(NSString*)resolution enclosureColor:(NSString*)enclosureColor;
- (void)setDeviceScreenSnapshot:(NSImage*)deviceScreenSnapshot;

@end

NS_ASSUME_NONNULL_END
