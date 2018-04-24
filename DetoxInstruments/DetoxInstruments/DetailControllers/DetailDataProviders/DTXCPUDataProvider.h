//
//  DTXCPUDataProvider.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "DTXDetailDataProvider.h"

@interface DTXCPUDataProvider : DTXDetailDataProvider

- (NSString*)titleOfCPUHeader;
- (BOOL)showsHeaviestThreadColumn;

@end
