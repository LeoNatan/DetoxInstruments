//
//  DTXRPCookiesEditor.m
//  DetoxInstruments
//
//  Created by Leo Natan on 3/3/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXRPCookiesEditor.h"

@interface _DTXRPEditorView : NSView @end
@implementation _DTXRPEditorView

- (NSInteger)tag
{
	return 100;
}

@end

@interface DTXRPCookiesEditor ()

@end

@implementation DTXRPCookiesEditor

- (void)setCookies:(NSDictionary<NSString *,NSString *> *)cookies
{
	self.plistEditor.propertyListObject = cookies;
}

- (NSDictionary<NSString *,NSString *> *)cookies
{
	return (id)self.plistEditor.propertyListObject;
}

#pragma mark LNPropertyListEditorDelegate

- (id)propertyListEditor:(LNPropertyListEditor *)editor defaultPropertyListForAddingInNode:(LNPropertyListNode*)node
{
	LNPropertyListNode* rv = [[LNPropertyListNode alloc] initWithPropertyListObject:@"Value"];
	rv.key = @"Cookie";
	
	return rv;
}

- (void)propertyListEditor:(LNPropertyListEditor *)editor didChangeNode:(LNPropertyListNode *)node changeType:(LNPropertyListNodeChangeType)changeType previousKey:(NSString *)previousKey
{
	[self.view.window.windowController.document updateChangeCount:NSChangeDone];
	
	[self willChangeValueForKey:@"cookies"];
	[self didChangeValueForKey:@"cookies"];
}

@end
