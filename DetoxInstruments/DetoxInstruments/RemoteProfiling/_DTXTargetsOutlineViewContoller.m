//
//  _DTXTargetsOutlineViewContoller.m
//  DetoxInstruments
//
//  Created by Leo Natan on 04/08/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "_DTXTargetsOutlineViewContoller.h"

@interface _DTXTargetsOutlineViewContoller ()
{
	IBOutlet NSLayoutConstraint* _constraint;
	IBOutlet NSButton* _profileButton;
	IBOutlet NSButton* _localOnlyButton;
	
	IBOutlet NSButton* _helpButton;
}

@property (nonatomic, strong, readwrite) IBOutlet NSOutlineView* outlineView;

@end

@implementation _DTXTargetsOutlineViewContoller

- (NSArray<NSButton *> *)actionButtons
{
	return @[_profileButton, _localOnlyButton];
}

- (NSArray<NSButton *> *)moreButtons
{
	return @[_helpButton];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.wantsLayer = YES;
	self.view.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
}

- (void)viewDidAppear
{
	[super viewDidAppear];
	
	[_outlineView.window makeFirstResponder:_outlineView];
}

//- (void)viewWillAppear
//{
//	_constraint.active = NO;
//	
//	[super viewWillAppear];
//}
//
//- (void)viewDidAppear
//{
//	_constraint.active = YES;
//	
//	[super viewDidAppear];
//}
//
//- (void)viewWillTransitionToSize:(NSSize)newSize
//{
//	[super viewWillTransitionToSize:newSize];
//}

@end
