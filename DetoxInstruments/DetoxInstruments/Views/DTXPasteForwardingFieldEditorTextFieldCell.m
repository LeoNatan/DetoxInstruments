//
//  DTXPasteForwardingFieldEditorTextFieldCell.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 5/13/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import "DTXPasteForwardingFieldEditorTextFieldCell.h"

@interface DTXPasteForwardingFieldEditor : NSTextView @end

@implementation DTXPasteForwardingFieldEditor

- (BOOL)isFieldEditor
{
	return YES;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
	if(aSelector == @selector(paste:) || aSelector == NSSelectorFromString(@"undo:") || aSelector == NSSelectorFromString(@"redo:") || aSelector == @selector(cut:))
	{
		return NO;
	}
	
	if(aSelector == @selector(copy:))
	{
		return self.selectedRange.length > 0;
	}
	
	return [super respondsToSelector:aSelector];
}

@end

@implementation DTXPasteForwardingFieldEditorTextFieldCell

- (NSTextView *)fieldEditorForView:(NSView *)controlView
{
	return [DTXPasteForwardingFieldEditor new];
}

@end
