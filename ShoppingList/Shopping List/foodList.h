//
//  foodList.h
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "listBase.h"

@interface foodList : listBase

@property int waitTime; //estimated time for items to be delivered
@property int driveTime; //amount of time to drive to store
@property int numberOfItems; //number of items to purchase
@property int time2Find; //time needed to find each item at store
@property int timePerStore; //total amount of time per store


@end




