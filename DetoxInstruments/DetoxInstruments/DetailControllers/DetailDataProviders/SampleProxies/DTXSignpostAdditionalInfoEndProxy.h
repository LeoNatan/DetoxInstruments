//
//  DTXSignpostAdditionalInfoEndProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan on 2/5/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTXSignpostSample;

@interface DTXSignpostAdditionalInfoEndProxy : NSObject

- (instancetype)initWithSignpostSample:(DTXSignpostSample*)sample;

@property (nonatomic, strong, readonly) DTXSignpostSample* sample;
@property (nonatomic, copy, readonly) NSString *additionalInfoEnd;

@end
