//
//  AllBusinessesDetailViewController.h
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>

@interface AllBusinessesDetailViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView  *mapview;
}

-(IBAction)returnHome:(id)sender;

@property (nonatomic, strong) MKMapView *mapview;
@end
