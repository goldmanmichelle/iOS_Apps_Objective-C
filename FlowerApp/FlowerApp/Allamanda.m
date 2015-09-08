//
//  Allamanda.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "Allamanda.h"
@implementation Allamanda

@synthesize timesDeadheaded, timesFertilized;

//customize init to set unique data members for Allamanda flowers
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setAnnualBloomTime: 6];
        [self setTimesDeadheaded:0];
        [self setTimesFertilized:10];
    }
    return self;
};

//overriding the base flower selection factors to account for unique data members
- (void)calculateBloomTime
{
    [self setAnnualBloomTime: (timesFertilized / timesDeadheaded )];
    NSLog(@"This plant will bloom for %i months during the year.", self.annualBloomTime);
}

@end