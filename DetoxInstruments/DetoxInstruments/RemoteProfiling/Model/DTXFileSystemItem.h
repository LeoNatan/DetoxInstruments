//
//  DTXFileSystemItem.h
//  DTXProfiler
//
//  Created by Leo Natan on 3/29/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTXFileSystemItem : NSObject <NSSecureCoding>

@property (nonatomic) BOOL isDirectory;
@property (nonatomic) BOOL isDirectoryForUI;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSNumber* size;
@property (nonatomic, copy) NSArray<DTXFileSystemItem*>* children;
@property (nonatomic, copy) NSURL* URL;

@property (nonatomic, weak) DTXFileSystemItem* parent;

- (instancetype)initWithFileURL:(NSURL*)fileURL;

- (NSData*)contents;
- (NSData*)zipContents;

- (NSComparisonResult)compare:(DTXFileSystemItem*)object;
- (BOOL)isEqualToFileSystemItem:(id)object;

@end
