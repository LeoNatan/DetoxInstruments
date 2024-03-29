//
//  DTXPlotTypeCellView.m
//  DetoxInstruments
//
//  Created by Leo Natan on 19/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXPlotTypeCellView.h"

@interface DTXPlotTypeCellView ()

@property (nonatomic, strong, readwrite) IBOutlet NSImageView* secondaryImageView;
@property (nonatomic, strong, readwrite) IBOutlet NSTextField* topLegendTextField;
@property (nonatomic, strong, readwrite) IBOutlet NSTextField* bottomLegendTextField;
@property (nonatomic, strong, readwrite) IBOutlet NSButton* settingsButton;
@property (nonatomic, strong, readwrite) IBOutlet NSPopUpButton* settingsMenuButton;

@end

@implementation DTXPlotTypeCellView

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.wantsLayer = YES;
	
	[_settingsMenuButton sendActionOn:NSEventMaskLeftMouseDown];
#if PROFILER_PREVIEW_EXTENSION
	self.textField.cell.lineBreakMode = NSLineBreakByWordWrapping;
	self.textField.allowsDefaultTighteningForTruncation = YES;
#endif
}

- (void)setBackgroundStyle:(NSBackgroundStyle)backgroundStyle
{
	[super setBackgroundStyle:backgroundStyle];
	
	self.settingsButton.highlighted = self.settingsMenuButton.highlighted = self.bottomLegendTextField.highlighted = self.topLegendTextField.highlighted = backgroundStyle == NSBackgroundStyleDark;
	[self.settingsButton.cell setBackgroundStyle:backgroundStyle];
	[self.settingsMenuButton.cell setBackgroundStyle:backgroundStyle];
}


@end
