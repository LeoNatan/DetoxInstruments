//
//  DTXViewCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 21/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXActionCellView.h"

@interface DTXViewCellView : DTXActionCellView

@property (nonatomic, strong, readonly) NSView* contentView;

@end
