//
//  SecondViewController.h
//  testApplication
//
//  Created by Michelle Goldman on 4/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@interface SecondViewController : UIViewController <UITableViewDelegate>

{
    IBOutlet UITableView *tableView3;
    IBOutlet UIButton *editButton;
    NSMutableArray *itemName;
    NSMutableArray *itemImage;
    NSMutableArray *itemLocation;
    NSMutableArray *itemStore;
    NSMutableArray *itemNotes;

}

-(IBAction)onEdit:(id)sender;

@end

