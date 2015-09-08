//
//  AppDelegate.m
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AllBusinessesDetailViewController.h"
#import "MyMapAnnotation.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self setUpLocations];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

//Set up locations in an array
-(void)setUpLocations
{
    
    CLLocationCoordinate2D bocaLocation;
    bocaLocation.latitude = 26.36935;
    bocaLocation.longitude = -80.172818;
    MyMapAnnotation *boca = [[MyMapAnnotation alloc] initWithTitle:@"Field of Flowers" coord:bocaLocation];
    
    CLLocationCoordinate2D cooperCityLocation;
    cooperCityLocation.latitude = 26.045011;
    cooperCityLocation.longitude = -80.29120599999999;
    MyMapAnnotation *cooperCity = [[MyMapAnnotation alloc] initWithTitle:@"De La Flor Gardens" coord:cooperCityLocation];

    CLLocationCoordinate2D coralSpringsLocation;
    coralSpringsLocation.latitude = 26.271507;
    coralSpringsLocation.longitude = -80.25113199999998;
    MyMapAnnotation *coralSprings = [[MyMapAnnotation alloc] initWithTitle:@"Geraci's Florist" coord:coralSpringsLocation];
    
    CLLocationCoordinate2D fortLauderdaleLocation;
    fortLauderdaleLocation.latitude = 26.0885789;
    fortLauderdaleLocation.longitude = -80.25101949999998;
    MyMapAnnotation *fortLauderdale = [[MyMapAnnotation alloc] initWithTitle:@"Tatiana's Flowers" coord:fortLauderdaleLocation];
    
    CLLocationCoordinate2D hollywoodLocation;
    hollywoodLocation.latitude = 26.025205;
    hollywoodLocation.longitude = -80.20851499999998;
    MyMapAnnotation *hollywood = [[MyMapAnnotation alloc] initWithTitle:@"Al's Florist & Gifts" coord:hollywoodLocation];
    
    CLLocationCoordinate2D pembrokePinesLocation;
    pembrokePinesLocation.latitude = 25.995039;
    pembrokePinesLocation.longitude = -80.2196295;
    MyMapAnnotation *pembrokePines = [[MyMapAnnotation alloc] initWithTitle:@"Patty's Flowers & Baskets" coord:pembrokePinesLocation];

    
    CLLocationCoordinate2D plantationLocation;
    plantationLocation.latitude = 25.995039;
    plantationLocation.longitude = -80.2196295;
    MyMapAnnotation *plantation = [[MyMapAnnotation alloc] initWithTitle:@"Pink Pussycat Flower Shop" coord:plantationLocation];

    
    CLLocationCoordinate2D sunriseLocation;
    sunriseLocation.latitude = 26.171762;
    sunriseLocation.longitude = -80.25672100000003;
    MyMapAnnotation *sunrise = [[MyMapAnnotation alloc] initWithTitle:@"Flowers from the Rainforest" coord:sunriseLocation];

    CLLocationCoordinate2D tamaracLocation;
    tamaracLocation.latitude = 26.1939085;
    tamaracLocation.longitude = -80.24402049999998;
    MyMapAnnotation *tamarac = [[MyMapAnnotation alloc] initWithTitle:@"Blossom Street Florist" coord:tamaracLocation];
    
    CLLocationCoordinate2D westonLocation;
    westonLocation.latitude = 26.1235965;
    westonLocation.longitude = -80.3610476;
    MyMapAnnotation *weston = [[MyMapAnnotation alloc] initWithTitle:@"Art of Flowers" coord:westonLocation];

    
    //Adding city names to locationArray
    self.locationArray = [[NSMutableArray alloc] initWithObjects: hollywood, weston, tamarac, cooperCity, boca, sunrise, coralSprings, pembrokePines, plantation, fortLauderdale, nil];
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
