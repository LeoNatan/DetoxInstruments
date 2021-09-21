//
//  CCNPreferencesWindowController+DocumentationGeneration.m
//  DetoxInstruments
//
//  Created by Leo Natan on 6/16/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#if DEBUG

#import "CCNPreferencesWindowController+DocumentationGeneration.h"

@interface CCNPreferencesWindowController ()

- (void)activateViewController:(id<CCNPreferencesWindowControllerProtocol>)viewController animate:(BOOL)animate;

@end

@implementation CCNPreferencesWindowController (DocumentationGeneration)

- (void)_drainLayout
{
	[self _drainLayoutWithDuration:0.3];
}

- (void)_activateControllerAtIndex:(NSUInteger)index
{
	id vc = [[self valueForKey:@"viewControllers"] objectAtIndex:index];
	self.window.toolbar.selectedItemIdentifier = [vc preferenceIdentifier];
	[self activateViewController:vc animate:NO];
}


@end

#endif
