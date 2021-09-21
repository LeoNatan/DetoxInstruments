//
//  DTXRPBodyEditor.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/6/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXKeyValueEditorViewController.h"

@interface DTXRPBodyEditor : DTXKeyValueEditorViewController

@property (nonatomic, strong, readonly) NSData* body;
@property (nonatomic, strong) NSString* contentType;

- (void)setBody:(NSData *)body withContentType:(NSString*)contentType;

@end
