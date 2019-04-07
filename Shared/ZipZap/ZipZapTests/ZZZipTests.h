//
//  ZZZipTests.h
//  ZipZap
//
//  Created by Glen Low on 18/10/12.
//  Copyright (c) 2012, Pixelglow Software. All rights reserved.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZZipTests : XCTestCase

- (void)setUp;
- (void)tearDown;

- (NSURL*)zipFileURL;
- (NSError*)someError;
- (NSData*)dataAtFilePath:(NSString*)filePath;
- (NSArray*)recordsForZipEntries:(NSArray*)zipEntries;
- (void)checkZipEntryRecords:(NSArray*)newEntryRecords
				checkerBlock:(nullable NSData*(^)(NSString* fileName))checkerBlock;

@end

NS_ASSUME_NONNULL_END
