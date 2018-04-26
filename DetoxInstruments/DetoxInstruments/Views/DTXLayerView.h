//
//  DTXLayerView.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/26/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXLayerView : NSView

@property (nonatomic, copy) void (^updateLayerHandler)(NSView* view);

@end
