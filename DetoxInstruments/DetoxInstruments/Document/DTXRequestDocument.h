//
//  DTXRequestDocument.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/13/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXRecordingDocument.h"

@interface DTXRequestDocument : NSDocument

- (void)loadRequestDetailsFromNetworkSample:(DTXNetworkSample*)networkSample document:(DTXRecordingDocument*)document;

@end
