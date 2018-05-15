//
//  DTXRecordingTargetPickerViewController+DocumentationGeneration.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 5/9/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "DTXRecordingTargetPickerViewController+DocumentationGeneration.h"

@interface __FAKE_DTXRemoteProfilingTarget : NSObject

@property (nonatomic, assign) NSUInteger deviceOSType;
@property (nonatomic, copy) NSString* appName;
@property (nonatomic, copy) NSString* deviceName;
@property (nonatomic, copy) NSString* deviceOS;
@property (nonatomic, copy) NSImage* deviceSnapshot;
@property (nonatomic, copy) NSDictionary* deviceInfo;

@property (nonatomic, strong) DTXFileSystemItem* containerContents;
@property (nonatomic, strong) id userDefaults;
@property (nonatomic, strong) NSArray<NSDictionary<NSString*, id>*>* cookies;
@property (nonatomic, copy) NSArray<DTXPasteboardItem*>* pasteboardContents;

@property (nonatomic, weak) id<DTXRemoteProfilingTargetDelegate> delegate;

@property (nonatomic, assign) DTXRemoteProfilingTargetState state;

@end

@implementation __FAKE_DTXRemoteProfilingTarget

- (void)loadContainerContents
{
	self.containerContents = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTXSourceRoot"] stringByAppendingPathComponent:@"../Documentation/Example Recording/Example Management Data/ContainerContents.dat"]];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate profilingTargetdidLoadContainerContents:(id)self];
	});
}

- (void)loadPasteboardContents
{
	self.pasteboardContents = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTXSourceRoot"] stringByAppendingPathComponent:@"../Documentation/Example Recording/Example Management Data/Pasteboard.dat"]];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate profilingTarget:(id)self didLoadPasteboardContents:self.pasteboardContents];
	});
}

- (void)loadCookies
{
	self.cookies = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTXSourceRoot"] stringByAppendingPathComponent:@"../Documentation/Example Recording/Example Management Data/Cookies.dat"]];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate profilingTarget:(id)self didLoadCookies:self.cookies];
	});
}

- (void)loadUserDefaults
{
	self.userDefaults = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTXSourceRoot"] stringByAppendingPathComponent:@"../Documentation/Example Recording/Example Management Data/UserDefaults.dat"]];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.delegate profilingTarget:(id)self didLoadUserDefaults:self.userDefaults];
	});
}


@end

@interface DTXRecordingTargetPickerViewController ()

- (void)_addTarget:(DTXRemoteProfilingTarget*)target forService:(NSNetService*)service;
- (IBAction)_manageProfilingTarget:(NSButton*)sender;

@end

@implementation DTXRecordingTargetPickerViewController (DocumentationGeneration)

static __FAKE_DTXRemoteProfilingTarget* fakeTarget;

- (void)_addFakeTarget
{
	fakeTarget = [__FAKE_DTXRemoteProfilingTarget new];
	fakeTarget.deviceOS = 0;
	fakeTarget.appName = @"Example App";
	fakeTarget.deviceName = @"iPhone X";
	fakeTarget.deviceOS = @"Version 11.4 (Build 15F5037c)";
	fakeTarget.deviceInfo = @{@"profilerVersion": @"0.9.1"};
	fakeTarget.state = DTXRemoteProfilingTargetStateDeviceInfoLoaded;
	
	fakeTarget.delegate = (id)self;
	
	[self _addTarget:(id)fakeTarget forService:(id)[NSObject new]];
	
	__FAKE_DTXRemoteProfilingTarget* fakeTarget = [__FAKE_DTXRemoteProfilingTarget new];
	fakeTarget.deviceOS = 0;
	fakeTarget.appName = @"Another App";
	fakeTarget.deviceName = @"Cool iPad";
	fakeTarget.deviceOS = @"Version 11.4 (Build 15F5037c)";
	fakeTarget.deviceInfo = @{@"profilerVersion": @"0.9.1", @"machineName": @"ipad5.3", @"deviceEnclosureColor": @2};
	fakeTarget.state = DTXRemoteProfilingTargetStateDeviceInfoLoaded;
	
	fakeTarget.delegate = (id)self;
	
	[self _addTarget:(id)fakeTarget forService:(id)[NSObject new]];
}

- (DTXProfilingTargetManagementWindowController*)_openManagementWindowController
{
	NSOutlineView* outlineView = [self valueForKey:@"outlineView"];
	[self _manageProfilingTarget:[[outlineView viewAtColumn:0 row:0 makeIfNecessary:NO] valueForKey:@"manageButton"]];
	return [[self valueForKey:@"_targetManagementControllers"] objectForKey:fakeTarget];
}

@end
