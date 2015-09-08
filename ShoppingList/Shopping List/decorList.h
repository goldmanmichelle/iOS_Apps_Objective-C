//
//  decorList.h
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "listBase.h"


@interface decorList : listBase

@property int waitTime; //estimated time for items to be delivered
@property int numberOfItems; //number of items to purchase
@property int driveTime; //amount of time to drive to store
@property int timePerStore; //total amount of time per store

@end
