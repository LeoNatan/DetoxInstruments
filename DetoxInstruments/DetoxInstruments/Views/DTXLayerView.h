//
//  DTXLayerView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/26/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXLayerView : NSView

@property (nonatomic, copy) void (^updateLayerHandler)(NSView* view);

@end
