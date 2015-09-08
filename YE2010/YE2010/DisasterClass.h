//
//  DisasterClass.h
//  YE2010
//
//  Created by Michelle Goldman on 3/11/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisasterClass : NSObject
{
    NSString *resourceList;
}

- (id)initWithAddlResources:(NSString *)resourceList;

@property (nonatomic, readonly)NSString *resourceList;
@end
