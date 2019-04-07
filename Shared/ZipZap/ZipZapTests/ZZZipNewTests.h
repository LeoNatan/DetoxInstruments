//
//  ZZZipNewTests.h
//  ZipZap
//
//  Created by Glen Low on 4/09/14.
//  Copyright (c) 2014, Pixelglow Software. All rights reserved.
//

#import "ZZZipTests.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZZipNewTests : ZZZipTests

- (void)setUp;
- (void)tearDown;

- (void)testCreatingZipWithNoEntries;
- (void)testCreatingZipEntriesWithDirectory;

- (void)testCreatingZipEntriesWithCompressedData;
- (void)testCreatingZipEntriesWithUncompressedData;

- (void)testCreatingZipEntriesWithCompressedStreamInSmallChunks;
- (void)testCreatingZipEntriesWithCompressedStreamInLargeChunks;
- (void)testCreatingZipEntriesWithUncompressedStreamInSmallChunks;
- (void)testCreatingZipEntriesWithUncompressedStreamInLargeChunks;

- (void)testCreatingZipEntriesWithCompressedImage;
- (void)testCreatingZipEntriesWithUncompressedImage;

- (void)testCreatingZipEntriesWithCompressedBadData;
- (void)testCreatingZipEntriesWithUncompressedBadData;
- (void)testCreatingZipEntriesWithCompressedBadStreamWriteNone;
- (void)testCreatingZipEntriesWithUncompressedBadStreamWriteNone;
- (void)testCreatingZipEntriesWithCompressedBadStreamWriteSome;
- (void)testCreatingZipEntriesWithUncompressedBadStreamWriteSome;
- (void)testCreatingZipEntriesWithCompressedBadDataConsumerWriteNone;
- (void)testCreatingZipEntriesWithUncompressedBadDataConsumerWriteNone;

- (void)testCreatingZipEntriesWithCompressedBadDataWithoutError;
- (void)testCreatingZipEntriesWithUncompressedBadDataWithoutError;
- (void)testCreatingZipEntriesWithCompressedBadStreamWithoutError;
- (void)testCreatingZipEntriesWithUncompressedBadStreamWithoutError;
- (void)testCreatingZipEntriesWithCompressedBadDataConsumerWithoutError;
- (void)testCreatingZipEntriesWithUncompressedBadDataConsumerWithoutError;

@end

NS_ASSUME_NONNULL_END
