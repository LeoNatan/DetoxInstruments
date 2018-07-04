//
//  DTXSampleGroupProxy.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXSampleContainerProxy.h"
#import "DTXInstrumentsModel.h"
#import "DTXInspectorDataProvider.h"

@interface DTXSampleGroupProxy : DTXSampleContainerProxy

@property (nonatomic, strong, readonly) DTXSampleGroup* sampleGroup;
@property (nonatomic, strong, readonly) NSArray<NSNumber*>* sampleTypes;

- (instancetype)initWithSampleGroup:(DTXSampleGroup*)sampleGroup sampleTypes:(NSArray<NSNumber*>*)sampleTypes outlineView:(NSOutlineView*)outlineView;

@end
