//
//  DTXDetailController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 4/24/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DTXDetailDataProvider.h"

@class DTXDetailController;

@class DTXDataExporter;

@protocol DTXDetailControllerDelegate

- (void)detailController:(DTXDetailController*)detailController didSelectInspectorItem:(DTXInspectorDataProvider*)item;

@end

@interface DTXDetailController : NSViewController <DTXDetailDataProviderDelegate>

@property (nonatomic, class, copy, readonly) NSString* defaultDetailControllerIdentifier;

@property (nonatomic, strong) DTXDetailDataProvider* detailDataProvider;
@property (nonatomic, copy, readonly) DTXDataExporter* dataExporter;
@property (nonatomic, weak) id<DTXDetailControllerDelegate> delegate;

@property (nonatomic, assign, readonly) BOOL supportsDataFiltering;
- (void)updateViewWithInsets:(NSEdgeInsets)insets;
- (void)filterSamples:(NSString*)filter;

@property (nonatomic, strong, readonly) DTXFilteredDataProvider* filteredDataProvider;
- (void)continueFilteringWithFilteredDataProvider:(DTXFilteredDataProvider*)filteredDataProvider;

- (void)selectSample:(DTXSample*)sample;

@property (nonatomic, copy, readonly) NSString* identifier;
@property (nonatomic, copy, readonly) NSString* displayName;
@property (nonatomic, strong, readonly) NSImage* smallDisplayIcon;

@end
