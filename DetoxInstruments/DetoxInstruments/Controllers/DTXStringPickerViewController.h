//
//  DTXStringPickerViewController.h
//  DetoxInstruments
//
//  Created by Leo Natan on 12/25/19.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DTXStringPickerViewController;

@protocol DTXStringPickerViewControllerDelegate <NSObject>

- (void)stringPickerDidChangeEnabledStrings:(DTXStringPickerViewController*)pvc;

@end

@interface DTXStringPickerViewController : NSViewController

@property (nonatomic, copy) NSOrderedSet<NSString*>* strings;
@property (nonatomic, copy) NSSet<NSString*>* enabledStrings;

@property (nonatomic, weak) id<DTXStringPickerViewControllerDelegate> delegate;

- (void)setShowsLoadingIndicator:(BOOL)showsLoadingIndicator;

@end
