//
//  DTXProfilingTargetManagementWindowController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/19/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "CCNPreferencesWindowController.h"
#import "DTXProfilingTargetManagement.h"

@interface DTXProfilingTargetManagementWindowController : CCNPreferencesWindowController

@property (nonatomic, strong) DTXRemoteTarget* profilingTarget;

- (void)noteProfilingTargetDidLoadContainerContents;
- (void)noteProfilingTargetDidLoadUserDefaults;
- (void)noteProfilingTargetDidLoadCookies;
- (void)noteProfilingTargetDidLoadPasteboardContents;

- (void)showSaveDialogForSavingData:(NSData*)data dataWasZipped:(BOOL)wasZipped;

@end
