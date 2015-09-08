//
//  Device.h
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

@class Contact;


@interface Device : NSManagedObject

@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * displayOrder;
@property (nonatomic, retain) NSString * carrier;
@property (nonatomic, retain) NSDate * date;


@property (nonatomic, strong) Contact *contact;


@end
