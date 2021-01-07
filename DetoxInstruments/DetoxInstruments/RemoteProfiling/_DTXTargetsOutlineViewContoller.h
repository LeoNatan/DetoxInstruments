//
//  _DTXTargetsOutlineViewContoller.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 04/08/2017.
//  Copyright © 2017-2021 Wix. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "_DTXActionButtonProvider.h"

@interface _DTXTargetsOutlineViewContoller : NSViewController <_DTXActionButtonProvider>

@property (nonatomic, strong, readonly) NSOutlineView* outlineView;
@property (nonatomic, strong, readonly) NSButton* profileButton;
@property (nonatomic, strong, readonly) NSButton* localOnlyButton;

@end
