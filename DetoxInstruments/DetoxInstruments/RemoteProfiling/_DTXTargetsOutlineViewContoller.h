//
//  _DTXTargetsOutlineViewContoller.h
//  DetoxInstruments
//
//  Created by Leo Natan on 04/08/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "_DTXActionButtonProvider.h"

@interface _DTXTargetsOutlineViewContoller : NSViewController <_DTXActionButtonProvider>

@property (nonatomic, strong, readonly) NSOutlineView* outlineView;
@property (nonatomic, strong, readonly) NSButton* profileButton;
@property (nonatomic, strong, readonly) NSButton* localOnlyButton;

@end
