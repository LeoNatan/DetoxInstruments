//
//  DTXRPSnippetExporter.h
//  DetoxInstruments
//
//  Created by Leo Natan on 3/10/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DTXRPSnippetExporter <NSObject>

+ (NSString*)snippetWithRequest:(NSURLRequest*)request;

@end
