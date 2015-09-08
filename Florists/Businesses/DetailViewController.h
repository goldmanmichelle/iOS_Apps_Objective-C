//
//  DetailViewController.h
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyMapAnnotation.h"

@interface DetailViewController : UIViewController

{
    IBOutlet MKMapView *mapview;
}

@property (nonatomic, strong) IBOutlet UILabel *locationTitle;
@property (nonatomic, strong) IBOutlet UILabel *locationLat;
@property (nonatomic, strong) IBOutlet UILabel *locationLong;
@property (nonatomic, strong) MyMapAnnotation *location;

-(IBAction)onClose:(id)sender;

@end
