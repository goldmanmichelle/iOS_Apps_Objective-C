//
//  AllBusinessesDetailViewController.m
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "AllBusinessesDetailViewController.h"
#import "MyMapAnnotation.h"
#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@interface AllBusinessesDetailViewController ()

@end

@implementation AllBusinessesDetailViewController
@synthesize mapview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Local Florists Near You", @"Local Florists Near You");
    }
    return self;
}

- (void)viewDidLoad
{
    //Creates mapview
    self.mapview = [[MKMapView alloc] initWithFrame:CGRectMake(0.0, 80, 320, 480)];
    self.mapview.delegate = self;
    
    
    //Configure level of zoom for mapview
    MKCoordinateSpan span;
    span.latitudeDelta = 0.80f;
    span.longitudeDelta = 0.80f;
    
    
    //Creates "centered" location
    CLLocationCoordinate2D location;
    location.latitude = 26.1336111;
    location.longitude = -80.1133333;
    
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    self.mapview.region = region;
    
    [self.mapview removeAnnotations:self.mapview.annotations];
    
    //Shares the custom info in AppDelegate with the second view
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    [self.mapview addAnnotations:del.locationArray];
    
    [self.view addSubview:self.mapview];
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

//return to main view/home screen
-(IBAction)returnHome:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}
@end
