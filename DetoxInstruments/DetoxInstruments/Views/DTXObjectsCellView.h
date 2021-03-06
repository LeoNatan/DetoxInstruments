//
//  DTXObjectsCellView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 24/08/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXObjectsCellView : NSTableCellView

@property (nonatomic, weak, readonly) NSOutlineView* objectsOutlineView;
@property (nonatomic, copy) NSArray* objects;

@end
