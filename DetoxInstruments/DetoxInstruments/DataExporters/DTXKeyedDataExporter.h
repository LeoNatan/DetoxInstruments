//
//  DTXKeyedDataExporter.h
//  DetoxInstruments
//
//  Created by Leo Natan on 11/29/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTXDataExporter.h"

@interface DTXKeyedDataExporter : DTXDataExporter

- (NSArray<NSString*>*)exportedKeyPaths;
- (NSArray<NSString*>*)titles;
- (NSFetchRequest*)fetchRequest;
- (id(^)(id))transformer;

@end
