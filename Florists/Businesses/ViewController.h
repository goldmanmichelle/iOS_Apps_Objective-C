//
//  ViewController.h
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@class AppDelegate;

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *businessTableView;
    IBOutlet UIButton *allBusinessesButton;
    AppDelegate *del;
}

- (IBAction)loadBusinesses:(id)sender;

@end
