//
//  DTXAcknowledgementsViewController.m
//  DetoxInstruments
//
//  Created by Leo Natan on 3/26/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXAcknowledgementsViewController.h"
@import WebKit;

@interface DTXAcknowledgementsViewController () <WKNavigationDelegate> @end

@implementation DTXAcknowledgementsViewController
{
//	IBOutlet __weak WKWebView* _webView;
	IBOutlet __weak NSTextView* _textView;
	NSURL* _htmlURL;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	_htmlURL = [[NSBundle mainBundle] URLForResource:@"Acknowledgements" withExtension:@"html"];
	
	NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithData:[NSData dataWithContentsOfURL:_htmlURL] options:@{NSDocumentTypeDocumentOption: NSHTMLTextDocumentType, NSCharacterEncodingDocumentOption: @(NSUTF8StringEncoding)} documentAttributes:nil error:NULL];
	[str addAttributes:@{NSForegroundColorAttributeName: NSColor.textColor} range:NSMakeRange(0, str.length)];
	
	[_textView.textStorage appendAttributedString:str];
	_textView.textContainerInset = NSMakeSize(20, 20);
}

- (void)viewDidAppear
{
	[super viewDidAppear];
	
	self.view.window.preventsApplicationTerminationWhenModal = NO;
}

@end
