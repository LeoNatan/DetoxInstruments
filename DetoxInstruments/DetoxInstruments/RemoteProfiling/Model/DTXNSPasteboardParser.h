//
//  DTXNSPasteboardParser.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 5/12/18.
//  Copyright © 2018 Wix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPasteboardItem.h"

@interface DTXNSPasteboardParser : NSObject

+ (NSArray<DTXPasteboardItem*>*)pasteboardItemsFromGeneralPasteboard;
+ (void)setGeneralPasteboardItems:(NSArray<DTXPasteboardItem*>*)pasteboardItems;

@end
