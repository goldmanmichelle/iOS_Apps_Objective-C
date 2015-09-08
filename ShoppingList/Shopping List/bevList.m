//
//  bevList.m
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "bevList.h"
#import "shoppingFactory.h"
#import "listBase.h"

@implementation bevList
@synthesize waitTime, numberOfItems, time2Find;

//Custome init to set data for Food List

-(id)init
{
    self = [super init];
    if(self !=nil)
    {
        [self setWaitTime:0];
        [self setNumberOfItems:0];
        [self setTime2Find:0];
        [self setTimePerStore:0];
    }
    return self;
}


//Override the time calcutaion to refactor for individual list needs
-(void)calcShopTime
{
    [self setTimePerStore:((numberOfItems * time2Find) + waitTime)];
}

@end
