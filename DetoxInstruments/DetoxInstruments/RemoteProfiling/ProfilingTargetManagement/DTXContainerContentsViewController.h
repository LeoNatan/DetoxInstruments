//
//  DTXContainerContentsViewController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/1/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXProfilingTargetManagement.h"

@interface DTXContainerContentsViewController : NSViewController <DTXProfilingTargetManagement>

- (void)showSaveDialogForSavingData:(NSData*)data dataWasZipped:(BOOL)wasZipped;

@end
