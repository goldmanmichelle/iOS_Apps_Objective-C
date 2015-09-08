//
//  BaseFlower.h
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseFlower : NSObject

{
    int flowerEnum;
}
typedef enum
{
    ALLAMANDA,
    LANTANA,
    SNAPDRAGON
} flowerEnum;

//properties that will be shared by all flower selections to be considered before purchasing
@property NSString *lightRange; //sun, partial shade, shade
@property NSString *soilMoisture; //light, moderate, heavy
@property NSString *soilTexture; //clay, sandy, loam
@property int annualBloomTime; //number of months plant  blooms annually

//initialize
- (id)init;

//calculation method to find number of months plant will bloom per year
- (void)calculateBloomTime;

@end
