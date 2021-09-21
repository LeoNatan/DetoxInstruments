//
//  DTXLogDetailController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/24/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXDetailController.h"
#import "DTXRecordingDocument.h"

@interface DTXLogDetailController : DTXDetailController

- (void)loadProviderWithDocument:(DTXRecordingDocument*)document;
- (void)scrollToTimestamp:(NSDate*)timestamp;

@end
