//
//  Lantana.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "Lantana.h"
@implementation Lantana

@synthesize nativeFlower, draughtTolerance, successRate;

//customize init to set unique data members for Lantana flowers
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        //setting data members to defaults
        [self setAnnualBloomTime:0];
        [self setNativeFlower:INDIGENOUS];
        [self setDraughtTolerance:0];
        NSLog(@"This is a good plant selection.");
    }
    return self;
};

//overriding calculation method
- (void)calculateBloomTime
{
    //check flower's draught tolerance level
    NSLog(@"Lantana has a draught tolerance of %i, lowering the success rate of this flower.", draughtTolerance);
    
    //set the annual bloom time based on whether the flower is a native plant and it's success rating
    if (nativeFlower == INDIGENOUS)
    {
        [self setAnnualBloomTime:6];
        [self setSuccessRate:(self.annualBloomTime + draughtTolerance)];
        NSLog(@"This flower has a pretty good chance of reaching its optimal bloom.");
        
    }
    else if (nativeFlower == FOREIGN)
    {
        self.annualBloomTime = 3;
        [self setSuccessRate:(self.annualBloomTime + draughtTolerance)];
        NSLog(@"This flower is not recommended for your region.");
        
    }
    else
    {
        NSLog(@"No valid origin was specified for this flower.");
    }
    
    //log out the probable success rate of achieving optimal bloom time for this flower based on these conditions
    NSLog(@"This flower has a success rating of %i.", self.successRate);
}

@end


