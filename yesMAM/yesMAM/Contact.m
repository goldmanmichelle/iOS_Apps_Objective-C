//
//  Contact.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/14/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "Contact.h"


@implementation Contact

@dynamic name, email, notes, devices, title, contactImage, contractDate, image, location;

/*
//add custom behavior that will inherit from NSObject to set the default date to the current day's date
- (void) awakeFromInsert
{
    [super awakeFromInsert];
    self.contractDate = [NSDate date];
}
*/
@end

#pragma mark -
@implementation ImageToDataTransformer

+ (BOOL)allowsReverseTransformation {
	return YES;
}

+ (Class)transformedValueClass {
	return [NSData class];
}

- (id)transformedValue:(id)value {
	NSData *data = UIImagePNGRepresentation(value);
	return data;
}

- (id)reverseTransformedValue:(id)value {
	UIImage *uiImage = [[UIImage alloc] initWithData:value];
	return uiImage;
}

@end
