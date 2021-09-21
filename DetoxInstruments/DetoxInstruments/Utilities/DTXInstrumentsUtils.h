//
//  DTXInstrumentsUtils.h
//  DetoxInstruments
//
//  Created by Leo Natan on 9/1/19.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTXInstrumentsUtils : NSObject

+ (NSString*)applicationVersion;
+ (NSString*)minimumProfilerFrameworkSupported;
+ (NSArray<NSBundle*>*)bundlesForObjectModel;
//🙈🙉🙊
+ (BOOL)isUnsupportedVersion;

@end
