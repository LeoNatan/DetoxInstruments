//
//  DTXStackTraceFrame.h
//  DetoxInstruments
//
//  Created by Leo Natan on 10/08/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

@import AppKit;

@interface DTXStackTraceFrame : NSObject

@property (nonatomic, copy) NSAttributedString* stackFrameText;
@property (nonatomic, copy) NSAttributedString* stackFrameDetailText;
@property (nonatomic, copy) NSString* fullStackFrameText;
@property (nonatomic, strong) NSImage* stackFrameIcon;
@property (nonatomic, strong) NSColor* imageTintColor;

@end
