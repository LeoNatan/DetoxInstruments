//
//  DTXTwoLabelsCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/16/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXTwoLabelsCellView : NSTableCellView

@property (nullable, assign) IBOutlet NSTextField *detailTextField;
@property (nullable, weak) IBOutlet NSButton* moreInfoButton;

@end
