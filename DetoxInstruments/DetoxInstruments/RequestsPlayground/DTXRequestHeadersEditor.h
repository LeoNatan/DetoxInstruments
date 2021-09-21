//
//  DTXRequestHeadersEditor.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/4/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXKeyValueEditorViewController.h"

@interface DTXRequestHeadersEditor : DTXKeyValueEditorViewController

@property (nonatomic, strong) NSDictionary<NSString*, NSString*>* requestHeaders;

@end
