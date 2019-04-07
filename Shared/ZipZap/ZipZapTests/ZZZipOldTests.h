//
//  ZZZipOldTests.h
//  ZipZap
//
//  Created by Glen Low on 4/09/14.
//  Copyright (c) 2014, Pixelglow Software. All rights reserved.
//

#import "ZZZipTests.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZZipOldTests : ZZZipTests

- (void)setUp;
- (void)tearDown;

- (void)testInsertingZipEntryAtFront;
- (void)testInsertingZipEntryAtBack;
- (void)testInsertingZipEntryAtMiddle;
- (void)testReplacingZipEntryAtFront;
- (void)testReplacingZipEntryAtBack;
- (void)testReplacingZipEntryAtMiddle;
- (void)testRemovingZipEntryAtFront;
- (void)testRemovingZipEntryAtBack;
- (void)testRemovingZipEntryAtMiddle;

- (void)testInsertingZipEntryWithCompressedBadData;
- (void)testInsertingZipEntryWithUncompressedBadData;
- (void)testInsertingZipEntryWithCompressedBadStreamWriteNone;
- (void)testInsertingZipEntryWithUncompressedBadStreamWriteNone;
- (void)testInsertingZipEntryWithCompressedBadStreamWriteSome;
- (void)testInsertingZipEntryWithUncompressedBadStreamWriteSome;
- (void)testInsertingZipEntryWithCompressedBadDataConsumerWriteNone;
- (void)testInsertingZipEntryWithUncompressedBadDataConsumerWriteNone;

@end

NS_ASSUME_NONNULL_END
