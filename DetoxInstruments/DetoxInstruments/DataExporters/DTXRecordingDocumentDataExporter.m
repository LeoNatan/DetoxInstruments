//
//  DTXRecordingDocumentDataExporter.m
//  DetoxInstruments
//
//  Created by Leo Natan on 11/29/18.
//  Copyright © 2017-2022 Leo Natan. All rights reserved.
//

#import "DTXRecordingDocumentDataExporter.h"

@implementation DTXRecordingDocumentDataExporter

- (NSData*)exportDataWithType:(DTXDataExportType)exportType error:(NSError**)error
{
	switch (exportType)
	{
		case DTXDataExportTypePropertyList:
			return [NSPropertyListSerialization dataWithPropertyList:[self.document.recordings valueForKey:@"cleanDictionaryRepresentationForPropertyList"] format:NSPropertyListBinaryFormat_v1_0 options:0 error:error];
		case DTXDataExportTypeJSON:
			return [NSJSONSerialization dataWithJSONObject:[self.document.recordings valueForKey:@"cleanDictionaryRepresentationForJSON"] options:NSJSONWritingPrettyPrinted error:error];
		default:
			return [super exportDataWithType:exportType error:error];
	}
}

@end
