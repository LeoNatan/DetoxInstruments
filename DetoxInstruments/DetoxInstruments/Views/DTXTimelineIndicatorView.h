//
//  DTXTimelineMouseView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 07/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DTXTimelineIndicatorView : NSView

@property (nonatomic) BOOL displaysIndicator;
@property (nonatomic) CGFloat indicatorOffset;
@property (nonatomic, weak) NSTableView* tableView;

@end
