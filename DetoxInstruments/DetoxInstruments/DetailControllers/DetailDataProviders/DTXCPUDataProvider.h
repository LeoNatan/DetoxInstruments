//
//  DTXCPUDataProvider.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/06/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXDetailDataProvider.h"

@interface DTXCPUDataProvider : DTXDetailDataProvider

- (NSString*)titleOfCPUHeader;
- (BOOL)showsHeaviestThreadColumn;

@end
