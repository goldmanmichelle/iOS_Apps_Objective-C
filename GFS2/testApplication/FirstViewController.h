//
//  FirstViewController.h
//  testApplication
//
//  Created by Michelle Goldman on 4/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreDetailViewController.h"

@interface FirstViewController : UIViewController <UITableViewDelegate>

{
    IBOutlet UITableView *tableView2;
    IBOutlet UIButton *editButton;
    NSMutableArray *storeName;
    NSMutableArray *storeAddress;
}

-(IBAction)onEdit:(id)sender;

@end