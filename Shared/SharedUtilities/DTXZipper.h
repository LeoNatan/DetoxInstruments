//
//  DTXZipper.h
//  DTXProfiler
//
//  Created by Leo Natan on 25/05/2017.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSURL* DTXTempZipURL(void);

extern BOOL DTXWriteZipFileWithURL(NSURL* zipURL, NSURL* contentsURL);
extern BOOL DTXWriteZipFileWithFileURL(NSURL* zipURL, NSURL* fileURL);
extern BOOL DTXWriteZipFileWithDirectoryURL(NSURL* zipURL, NSURL* directoryURL);

extern BOOL DTXWriteZipFileWithURLArray(NSURL* zipURL, NSArray<NSURL*>* contentsURLs);

extern BOOL DTXExtractZipToURL(NSURL* zipURL, NSURL* targetURL);
extern BOOL DTXExtractDataZipToURL(NSData* zipData, NSURL* targetURL);
