//
//  FlowerFactory.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "FlowerFactory.h"
#import "BaseFlower.h"

@implementation FlowerFactory

+(BaseFlower*)SelectFlower:(int)flowerType;
{
    //if Allamanda is requested, select this flower
    if (flowerType == ALLAMANDA)
    {
        return [[Allamanda alloc] init];
    }
    else if (flowerType == LANTANA)
    {
        return [[Lantana alloc] init];
    }
    else if (flowerType == SNAPDRAGON)
    {
        return [[Snapdragon alloc] init];
    }
    else return nil;
}
@end

