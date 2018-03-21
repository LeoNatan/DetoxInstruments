//
//  DTXManagedPlotControllerGroup.h
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 02/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXPlotController.h"

@class DTXManagedPlotControllerGroup;

@protocol DTXManagedPlotControllerGroupDelegate <NSObject>

- (void)managedPlotControllerGroup:(DTXManagedPlotControllerGroup*)group didSelectPlotController:(id<DTXPlotController>)plotController;

@end

@interface DTXManagedPlotControllerGroup : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithHostingOutlineView:(NSOutlineView*)outlineView;

@property (nonatomic, weak) id<DTXManagedPlotControllerGroupDelegate> delegate;

- (void)addHeaderPlotController:(id<DTXPlotController>)headerPlotController;

//Main plot controllers
- (NSArray<id<DTXPlotController>>*)plotControllers;
- (void)addPlotController:(id<DTXPlotController>)plotController;
- (void)insertPlotController:(id<DTXPlotController>)plotController afterPlotController:(id<DTXPlotController>)afterPlotController;
- (void)removePlotController:(id<DTXPlotController>)plotController;

//Child plot controllers
- (NSArray<id<DTXPlotController>>*)childPlotControllersForPlotController:(id<DTXPlotController>)plotController;
- (void)addChildPlotController:(id<DTXPlotController>)childPlotController toPlotController:(id<DTXPlotController>)plotController;
- (void)insertChildPlotController:(id<DTXPlotController>)childPlotController afterChildPlotController:(id<DTXPlotController>)afterPlotController ofPlotController:(id<DTXPlotController>)plotController;
- (void)removeChildPlotController:(id<DTXPlotController>)childPlotController ofPlotController:(id<DTXPlotController>)plotController;

//Group plot range control
- (void)setLocalStartTimestamp:(NSDate*)startTimestamp endTimestamp:(NSDate*)endTimestamp;
- (void)setGlobalStartTimestamp:(NSDate*)startTimestamp endTimestamp:(NSDate*)endTimestamp;
- (void)zoomIn;
- (void)zoomOut;
- (void)zoomToFitAllData;

@end
