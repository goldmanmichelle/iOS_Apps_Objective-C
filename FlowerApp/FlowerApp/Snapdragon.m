//
//  Snapdragon.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "Snapdragon.h"

@implementation Snapdragon
@synthesize draughtTolerance, hardinessZone;

//customize init to set unique data members for Lantana flowers
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        //setting data members to defaults
        [self setAnnualBloomTime:4];
        [self setDraughtTolerance:0];
        [self setHardinessZone:8];
        NSLog(@"This plant has a fair chance of success in your region.");
    }
    return self;
};

//overriding calculation method
- (void)calculateBloomTime
{
    [self setAnnualBloomTime: (hardinessZone - draughtTolerance)];
    NSLog(@"This plant will bloom for %i months during the year.", self.annualBloomTime);
}

@end
