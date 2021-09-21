//
//  DTXActivityBaseDataProvider.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/25/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXDetailDataProvider.h"

@interface DTXActivityBaseDataProvider : DTXDetailDataProvider

@property (nonatomic, copy) NSSet<NSString*>* enabledCategories;

@end
