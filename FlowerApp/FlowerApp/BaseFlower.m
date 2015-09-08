//
//  BaseFlower.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "BaseFlower.h"

@implementation BaseFlower
//synthesize creates get/set methods per property
@synthesize lightRange, soilMoisture, soilTexture, annualBloomTime;

//initialize the base flower selection, creating the instance and setting annual time to bloom to zero
- (id)init
{
    self = [super init];
    if (self != nil)
    {
        //self methods created by the synthesize
        [self setAnnualBloomTime:0]; //number of months flower should bloom per year
        [self setLightRange:@""];  //amount of light needed for each flower type
        [self setSoilMoisture:nil]; //amount of moisture needed for each flower type
        [self setSoilTexture:nil];  //type of soil required for each flower type
    }
    return self;
}
//calculation method to find number of months plant will bloom per year
- (void)calculateBloomTime
{
    
    NSLog(@"This plant will bloom for %i months during the year if all the right elements are present.", annualBloomTime);
}

@end

