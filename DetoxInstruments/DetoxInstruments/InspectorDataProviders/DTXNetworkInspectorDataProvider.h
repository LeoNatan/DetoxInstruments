//
//  DTXNetworkInspectorDataProvider.h
//  DetoxInstruments
//
//  Created by Leo Natan on 17/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import "DTXInspectorDataProvider.h"

@interface DTXNetworkInspectorDataProvider : DTXInspectorDataProvider

+ (DTXInspectorContent*)inspctorContentForData:(NSData*)data response:(NSURLResponse*)response;
+ (NSString*)fileNameBestEffortWithResponse:(NSURLResponse*)response;

@end
