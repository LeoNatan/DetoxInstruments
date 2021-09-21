//
//  DTXNSPasteboardParser.h
//  DetoxInstruments
//
//  Created by Leo Natan on 5/12/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPasteboardItem.h"

@interface DTXNSPasteboardParser : NSObject

+ (NSArray<DTXPasteboardItem*>*)pasteboardItemsFromGeneralPasteboard;
+ (void)setGeneralPasteboardItems:(NSArray<DTXPasteboardItem*>*)pasteboardItems;

@end
