//
//  DTXRecordingTargetPickerViewController+DocumentationGeneration.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 5/9/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "DTXRecordingTargetPickerViewController+DocumentationGeneration.h"
#import "DevicePreviewImagesDocumentationGeneration.h"

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface __FAKE_DTXRemoteTarget : NSObject

@property (nonatomic, assign) NSUInteger deviceOSType;
@property (nonatomic, copy) NSString* appName;
@property (nonatomic, copy) NSString* deviceName;
@property (nonatomic, copy) NSString* deviceOS;
@property (nonatomic, copy) NSImage* screenSnapshot;
@property (nonatomic, copy) NSDictionary* deviceInfo;

@property (nonatomic, strong) DTXFileSystemItem* containerContents;
@property (nonatomic, strong) id userDefaults;
@property (nonatomic, strong) NSArray<NSDictionary<NSString*, id>*>* cookies;
@property (nonatomic, copy) NSArray<DTXPasteboardItem*>* pasteboardContents;

@property (nonatomic, weak) id<DTXRemoteTargetDelegate> delegate;

@property (nonatomic, assign) DTXRemoteTargetState state;

@end

@implementation __FAKE_DTXRemoteTarget

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

- (BOOL)isCompatibleWithInstruments
{
	return YES;
}


@end

@interface DTXRecordingTargetPickerViewController ()

- (void)_addTarget:(DTXRemoteTarget*)target forService:(NSNetService*)service;
- (IBAction)_manageProfilingTarget:(NSButton*)sender;

@end

@implementation DTXRecordingTargetPickerViewController (DocumentationGeneration)

static __FAKE_DTXRemoteTarget* fakeTarget;

- (void)_addFakeTarget
{
	fakeTarget = [__FAKE_DTXRemoteTarget new];
	fakeTarget.deviceOS = 0;
	fakeTarget.appName = @"Example App";
	fakeTarget.deviceName = @"iPhone XS Max";
	fakeTarget.deviceOS = @"Version 12.1 (Build 16A405)";
	fakeTarget.deviceInfo = @{@"profilerVersion": @"1.4", @"machineName": @"iPhone11,6"};
	fakeTarget.screenSnapshot = __DTXiPhoneXSMaxScreenshot();
	fakeTarget.state = DTXRemoteTargetStateDeviceInfoLoaded;
	
	fakeTarget.delegate = (id)self;
	
	[self _addTarget:(id)fakeTarget forService:(id)[NSObject new]];
	
	__FAKE_DTXRemoteTarget* fakeTarget = [__FAKE_DTXRemoteTarget new];
	fakeTarget.deviceOS = 0;
	fakeTarget.appName = @"Another App";
	fakeTarget.deviceName = @"iPad Pro";
	fakeTarget.deviceOS = @"Version 12.1 (Build 16A405)";
	fakeTarget.deviceInfo = @{@"profilerVersion": @"200.0", @"machineName": @"iPad5.3", @"deviceEnclosureColor": @2};
	fakeTarget.screenSnapshot = __DTXiPadScreenshot();
	fakeTarget.state = DTXRemoteTargetStateDeviceInfoLoaded;
	
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
