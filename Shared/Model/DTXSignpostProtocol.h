//
//  DTXSignpostProtocol.h
//  DetoxInstruments
//
//  Created by Leo Natan on 7/4/18.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#ifndef DTXSignpostProtocol_h
#define DTXSignpostProtocol_h

@protocol DTXSignpost <NSObject>

@property (nonatomic, strong, readonly) NSString* name;
@property (nonatomic, strong, readonly) NSDate* timestamp;
@property (nonatomic, strong, readonly) NSDate* endTimestamp;
@property (nonatomic, strong, readonly) NSDate* defactoEndTimestamp;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, readonly) NSTimeInterval minDuration;
@property (nonatomic, readonly) NSTimeInterval avgDuration;
@property (nonatomic, readonly) NSTimeInterval stddevDuration;
@property (nonatomic, readonly) NSTimeInterval maxDuration;

@property (nonatomic, readonly) BOOL isExpandable;
@property (nonatomic, readonly) BOOL isEvent;

@end

#endif /* DTXSignpostProtocol_h */
