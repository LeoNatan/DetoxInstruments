//
//  DTXGraphHostingView.h
//  DetoxInstruments
//
//  Created by Leo Natan on 09/06/2017.
//  Copyright © 2017-2021 Leo Natan. All rights reserved.
//

#import <CorePlot/CorePlot.h>

@interface DTXGraphHostingView : CPTGraphHostingView

@property (getter=isFlipped, readwrite) BOOL flipped;

@end
