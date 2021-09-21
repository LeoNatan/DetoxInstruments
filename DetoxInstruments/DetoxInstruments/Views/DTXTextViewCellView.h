//
//  DTXTextViewCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 14/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXActionCellView.h"

@interface DTXTextViewCellView : DTXActionCellView

@property (nonatomic, strong, readonly) NSTextField* contentTextField;
@property (nonatomic, strong, readonly) NSLayoutConstraint* titleContentConstraint;
@property (nonatomic, strong, readonly) NSBox* titleContainer;

@end
