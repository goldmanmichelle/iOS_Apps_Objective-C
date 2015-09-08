//
//  DetailViewController.m
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //Set initial span & zoom 
    MKCoordinateSpan span;
    span.latitudeDelta = 0.15f;
    span.longitudeDelta = 0.15f;
    
    //Set latitude & longitude that map is "centered" on
    CLLocationCoordinate2D location;
    location.latitude = 26.1336111;
    location.longitude = -80.1133333;
    
    //Set region, by current location
    MKCoordinateRegion region;
    region.center = self.location.coordinate;
    region.span = span;
    mapview.region = region;
    
    //Adds annotation
    [mapview addAnnotation:self.location];
    
    //Adds information to the view from the array
    self.title = self.location.title;
    self.locationTitle.text = self.location.title;
    self.locationLat.text = [NSString stringWithFormat:@"%f", self.location.coordinate.latitude];
    self.locationLong.text = [NSString stringWithFormat:@"%f", self.location.coordinate.longitude];
    

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//create custom map pin settings
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"CustomPin"];
    annotationView.animatesDrop = true;
    annotationView.pinColor = MKPinAnnotationColorPurple;
    annotationView.calloutOffset = CGPointMake(-5, 5);
    annotationView.canShowCallout = true;
    
    return annotationView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}
@end
