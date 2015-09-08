//
//  Lantana.h
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "BaseFlower.h"

@interface Lantana : BaseFlower
{
    int originEnum;
}

typedef enum
{
    INDIGENOUS,
    FOREIGN
} originEnum;

@property int nativeFlower;// 0 for native, 1 for non-native
@property int draughtTolerance; //drought tolerance numeric rating 1-10
@property int successRate; //number to determine the likelihood that optimal blooming will occur for this flower
@end
