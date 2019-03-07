//
//  DTXRequestHeadersEditor.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 3/4/19.
//  Copyright © 2019 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXKeyValueEditorViewController.h"

@interface DTXRequestHeadersEditor : DTXKeyValueEditorViewController

@property (nonatomic, strong) NSDictionary<NSString*, NSString*>* requestHeaders;

- (void)setHeadersWithResponse:(NSHTTPURLResponse*)response;

@end
