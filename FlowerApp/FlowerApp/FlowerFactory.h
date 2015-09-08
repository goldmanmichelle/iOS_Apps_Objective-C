//
//  FlowerFactory.h
//  FlowerApp
//
//  Created by Michelle Goldman on 2/13/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFlower.h"
#import "Allamanda.h"
#import "Lantana.h"
#import "Snapdragon.h"



@interface FlowerFactory : NSObject

//static/class method to return a base flower selection to plant/grow
+(BaseFlower*)SelectFlower:(int)flowerType;

@end