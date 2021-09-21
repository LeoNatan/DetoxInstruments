//
//  DTXViewCellView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 21/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXViewCellView.h"

@interface DTXViewCellView ()

@property (nonatomic, strong, readwrite) IBOutlet NSView* contentView;

@end

@implementation DTXViewCellView

- (void)prepareForReuse
{
	[super prepareForReuse];
	
	[self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof NSView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[obj removeFromSuperview];
	}];
}

@end
