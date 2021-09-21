//
//  DTXRPCookiesEditor.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/3/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXCookiesEditorViewController.h"
#import "DTXKeyValueEditorViewController.h"

@interface DTXRPCookiesEditor : DTXKeyValueEditorViewController

@property (nonatomic, strong) NSDictionary<NSString*, NSString*>* cookies;

@end
