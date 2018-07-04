//
//  AppDelegate.h
//  StressTestApp
//
//  Created by Leo Natan (Wix) on 22/05/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;
#import <os/signpost.h>

@class DTXProfiler;

extern DTXProfiler* __profiler;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) UIWebView* webView;


@end

