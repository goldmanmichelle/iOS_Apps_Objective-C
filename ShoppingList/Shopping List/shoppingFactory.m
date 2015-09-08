//
//  shoppingFactory.m
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "shoppingFactory.h"

@implementation shoppingFactory

+(listBase *)goShopping:(int)listType
{

        if (listType == FOOD)
        {
            return [[foodList alloc]init];
        }else if (listType == DECORATIONS)
        {
            return [[decorList alloc]init];
        }else if (listType == BEVERAGES)
        {
            return [[bevList alloc]init];
        }else
            return nil;
    
}
@end
