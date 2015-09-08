//
//  Contact.h
//  yesMAM
//
//  Created by Michelle Goldman on 6/14/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//


@interface ImageToDataTransformer : NSValueTransformer
@end

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSDate *contractDate;
@property (nonatomic, retain) NSSet *devices;
@property (nonatomic, strong) UIImage *contactImage;

@property (nonatomic, strong) NSManagedObject *image;
@property (nonatomic, strong) NSManagedObject *location;//same term as what's listed in data model for ContactLocation Entity > Relationship & Inverse

@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addDevicesObject:(NSManagedObject *)value;
- (void)removeDevicesObject:(NSManagedObject *)value;
- (void)addDevices:(NSSet *)value;
- (void)removeDevices:(NSSet *)value;

@end
