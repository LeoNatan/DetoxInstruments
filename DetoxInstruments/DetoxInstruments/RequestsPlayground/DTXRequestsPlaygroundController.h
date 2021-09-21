//
//  DTXRequestsPlaygroundController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/3/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXRequestsPlaygroundController : NSViewController

@property (strong) IBOutlet NSTabView *tabView;
@property (strong) IBOutlet NSTouchBar* touchBar;

- (void)loadRequestDetailsFromNetworkSample:(DTXNetworkSample*)networkSample;
- (void)loadRequestDetailsFromURLRequest:(NSURLRequest*)request;
- (NSURLRequest*)requestForSaving;

@end
