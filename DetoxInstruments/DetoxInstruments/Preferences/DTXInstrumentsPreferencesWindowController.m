//
//  DTXInstrumentsPreferencesWindowController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 6/11/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXInstrumentsPreferencesWindowController.h"
#import "DTXDisplayPreferencesViewController.h"

@interface DTXInstrumentsPreferencesWindowController ()

@end

@implementation DTXInstrumentsPreferencesWindowController

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
	
	NSStoryboard* sb = [NSStoryboard storyboardWithName:@"Preferences" bundle:nil];
	
	[self setPreferencesViewControllers:@[[sb instantiateControllerWithIdentifier:@"DisplayPreferences"], [sb instantiateControllerWithIdentifier:@"RecordingPreferences"]]];
	
	self.centerToolbarItems = NO;
	
	if (@available(macOS 11.0, *))
	{
		self.window.toolbarStyle = NSWindowToolbarStylePreference;
	}
	self.window.styleMask &= ~NSWindowStyleMaskMiniaturizable;
	
	[super showPreferencesWindow];
	
	[self.window center];
}

@end
