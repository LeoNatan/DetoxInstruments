//
//  DTXKeyValueEditorViewController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/4/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@import LNPropertyListEditor;

@interface DTXKeyValueEditorViewController : NSViewController <LNPropertyListEditorDelegate>

@property (nonatomic, strong) IBOutlet LNPropertyListEditor* plistEditor;

@end

