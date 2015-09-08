//
//  listBase.h
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface listBase : NSObject

{
    int listEnum;
}

typedef enum //enum
{
    FOOD,
    DECORATIONS,
    BEVERAGES
}listEnum;

//data members
@property (strong) NSArray *items; //items to purchase
@property int driveTime; // amount of time to drive to each store
@property int timePerStore; // amount of time needed to shop at each store
@property bool customOrder; // is this a custom order



-(id)init; //initialize

//calculation method to find amount of time to acquire list items
-(void)calcShopTime;

@end
