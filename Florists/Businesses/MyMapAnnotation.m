//
//  MyMapAnnotation.m
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation
@synthesize title, coordinate;

-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord
{
    if ((self = [super init]))
    {
        title = text;
        coordinate = coord;
    }
    return self;
}
@end
