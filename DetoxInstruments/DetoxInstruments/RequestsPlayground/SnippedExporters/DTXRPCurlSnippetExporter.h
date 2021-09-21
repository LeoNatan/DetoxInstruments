//
//  DTXRPCurlSnippetExporter.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/10/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXRPSnippetExporter.h"

@interface DTXRPCurlSnippetExporter : NSObject <DTXRPSnippetExporter>

+ (NSString*)snippetWithRequest:(NSURLRequest*)request;

@end
