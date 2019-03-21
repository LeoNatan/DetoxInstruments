//
//  DTXProfilingTargetManagementWindowController.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 4/19/18.
//  Copyright © 2017-2019 Wix. All rights reserved.
//

#import "DTXProfilingTargetManagementWindowController.h"
#import "DTXContainerContentsViewController.h"
#import "DTXUserDefaultsViewController.h"
#import "DTXCookiesViewController.h"
#import "DTXPasteboardViewController.h"

@interface CCNPreferencesWindowController ()

- (void)setupToolbar;
- (void)toolbarItemAction:(NSToolbarItem *)toolbarItem;

@property (strong) NSToolbar *toolbar;

@property (strong) NSMutableOrderedSet *viewControllers;

@end

@interface DTXProfilingTargetManagementWindowController ()
{
	NSStoryboard* _storyboard;
	DTXContainerContentsViewController* _containerContentsOutlineViewController;
	DTXUserDefaultsViewController* _userDefaultsViewController;
	DTXCookiesViewController* _cookiesViewController;
	DTXPasteboardViewController* _pasteboardViewController;
	
	NSArray<id<DTXProfilingTargetManagement>>* _controllers;
}

@property (strong) NSSegmentedControl *touchBarSegmentedControl;

@end

@implementation DTXProfilingTargetManagementWindowController

- (instancetype)init
{
	self = [super init];
	
	if(self)
	{
		_storyboard = [NSStoryboard storyboardWithName:@"TargetManagement" bundle:NSBundle.mainBundle];
		
		self.allowsVibrancy = NO;
		self.centerToolbarItems = YES;
	}
	
	return self;
}

- (void)setProfilingTarget:(DTXRemoteTarget *)profilingTarget
{
	_profilingTarget = profilingTarget;
	
	self.titleOverride = [NSString stringWithFormat:@"%@ — %@", profilingTarget.appName, profilingTarget.deviceName];
	
	[_controllers enumerateObjectsUsingBlock:^(id<DTXProfilingTargetManagement>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[obj setProfilingTarget:profilingTarget];
	}];
}

- (void)noteProfilingTargetDidLoadContainerContents
{
	[_containerContentsOutlineViewController noteProfilingTargetDidLoadServiceData];
}

- (void)noteProfilingTargetDidLoadUserDefaults
{
	[_userDefaultsViewController noteProfilingTargetDidLoadServiceData];
}

- (void)noteProfilingTargetDidLoadCookies
{
	[_cookiesViewController noteProfilingTargetDidLoadServiceData];
}

- (void)noteProfilingTargetDidLoadPasteboardContents
{
	[_pasteboardViewController noteProfilingTargetDidLoadServiceData];
}

- (void)showSaveDialogForSavingData:(NSData*)data dataWasZipped:(BOOL)wasZipped
{
	if(self.window.isVisible == NO)
	{
		//Window is hidden—do not display the save dialog.
		return;
	}
	
	[_containerContentsOutlineViewController showSaveDialogForSavingData:data dataWasZipped:wasZipped];
}

- (void)showPreferencesWindow
{
	if([self.window isVisible])
	{
		[self.window makeKeyAndOrderFront:nil];
		
		return;
	}
	
	if(self.window == nil)
	{
		[self loadWindow];
	}
	
	_containerContentsOutlineViewController = [_storyboard instantiateControllerWithIdentifier:@"DTXContainerContentsViewController"];
	[_containerContentsOutlineViewController view];
	
	_userDefaultsViewController = [_storyboard instantiateControllerWithIdentifier:@"DTXUserDefaultsViewController"];
	[_userDefaultsViewController view];
	
	_cookiesViewController = [_storyboard instantiateControllerWithIdentifier:@"DTXCookiesViewController"];
	[_cookiesViewController view];
	
	_pasteboardViewController = [_storyboard instantiateControllerWithIdentifier:@"DTXPasteboardViewController"];
	[_pasteboardViewController view];
	
	_controllers = @[_containerContentsOutlineViewController, _pasteboardViewController, _userDefaultsViewController, _cookiesViewController];
	
	[_controllers enumerateObjectsUsingBlock:^(id<DTXProfilingTargetManagement>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[obj setProfilingTarget:self.profilingTarget];
	}];
	
	[self setPreferencesViewControllers:_controllers];
	
//	self.window.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantDark];
	
	[super showPreferencesWindow];
	
	[self.window center];
}

- (void)setupToolbar
{
	[super setupToolbar];
	
	self.touchBar = [self makeTouchBar];
}

- (IBAction)_touchBarSegmentedControlAction:(NSSegmentedControl*)sender
{
	NSToolbarItem* selectedItem = self.toolbar.items[sender.selectedSegment + 1];
	
	self.toolbar.selectedItemIdentifier = selectedItem.itemIdentifier;
	
	[self toolbarItemAction:selectedItem];
}

- (NSTouchBar *)makeTouchBar
{
	self.touchBarSegmentedControl = [NSSegmentedControl segmentedControlWithLabels:[self.viewControllers valueForKey:@"preferenceTitle"] trackingMode:NSSegmentSwitchTrackingSelectOne target:self action:@selector(_touchBarSegmentedControlAction:)];
	
	[self.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[self.touchBarSegmentedControl setWidth:150 forSegment:idx];
	}];
	
	[self _synchronizeToolbarToTouchBarSegmentedControl];
	
	NSMutableArray<NSString*>* buttonIdentifiers = [NSMutableArray new];
	NSMutableSet<NSTouchBarItem*>* buttonsSet = [NSMutableSet new];
	
	[buttonIdentifiers addObject:NSTouchBarItemIdentifierFlexibleSpace];
	
	NSCustomTouchBarItem *buttonBarItem = [[NSCustomTouchBarItem alloc] initWithIdentifier:@"Segment"];
	buttonBarItem.view = self.touchBarSegmentedControl;
	[buttonIdentifiers addObject:buttonBarItem.identifier];
	[buttonsSet addObject:buttonBarItem];
	
	[buttonIdentifiers addObject:NSTouchBarItemIdentifierFlexibleSpace];
	
	NSTouchBar* bar = [NSTouchBar new];
	bar.defaultItemIdentifiers = buttonIdentifiers;
	bar.templateItems = buttonsSet;//[NSSet setWithObject:group];
	
	return bar;
}

- (void)toolbarItemAction:(NSToolbarItem *)toolbarItem
{
	[super toolbarItemAction:toolbarItem];
	
	[self _synchronizeToolbarToTouchBarSegmentedControl];
}

- (void)_synchronizeToolbarToTouchBarSegmentedControl
{
	__block NSUInteger itemIdx = 0;
	[self.toolbar.items enumerateObjectsUsingBlock:^(__kindof NSToolbarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if([obj.itemIdentifier isEqualToString:self.toolbar.selectedItemIdentifier])
		{
			itemIdx = idx - 1;
		}
	}];
	
	self.touchBarSegmentedControl.selectedSegment = itemIdx;
}


@end
