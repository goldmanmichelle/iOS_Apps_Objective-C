//
//  shoppingFactory.h
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "listBase.h"
#import "foodList.h"
#import "decorList.h"
#import "bevList.h"

@interface shoppingFactory : NSObject

+(listBase *)goShopping:(int)listType;


@end


