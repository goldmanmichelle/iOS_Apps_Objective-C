//
//  listBase.m
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "listBase.h"

@implementation listBase

//Creates get and set methods
@synthesize  driveTime, timePerStore, customOrder;

-(id)init; //initialize
{
    self = [super init];
    if(self !=nil)
    {
        [self setDriveTime:0];       // amount of time to drive to each store
        [self setTimePerStore:0];   // average time spent at each store
        [self setCustomOrder:false];  // custom orders will have 2 days added on to time

    }
    return self;
}

//calculation method to find amount of time to acquire list items
-(void)calcShopTime
{
    NSLog(@"It will take approximately %i minutes to obtain the list items from this store.", timePerStore);
}

@end
