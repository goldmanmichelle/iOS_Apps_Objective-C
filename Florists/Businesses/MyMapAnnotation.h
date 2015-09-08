//
//  MyMapAnnotation.h
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyMapAnnotation : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}


-(id)initWithTitle:(NSString *)text coord:(CLLocationCoordinate2D)coord;

@property (nonatomic, copy)NSString *title;
@property (nonatomic, readonly)CLLocationCoordinate2D coordinate; //only want to be able to read coordinate

@end
