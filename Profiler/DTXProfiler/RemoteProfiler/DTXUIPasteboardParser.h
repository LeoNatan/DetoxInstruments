//
//  DTXUIPasteboardParser.h
//  DTXProfiler
//
//  Created by Leo Natan on 5/4/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPasteboardItem.h"

@interface DTXUIPasteboardParser : NSObject

+ (NSArray<DTXPasteboardItem*>*)pasteboardItemsFromGeneralPasteboard;
+ (void)setGeneralPasteboardItems:(NSArray<DTXPasteboardItem*>*)items;

@end
