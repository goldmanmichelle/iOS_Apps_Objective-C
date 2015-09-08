//
//  ViewController.h
//  SFFlowers
//
//  Created by Michelle Goldman on 3/4/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *flowerTableView;
    IBOutlet UIButton *editButton;
    NSMutableArray *flowerArray;
    NSMutableArray *flowerImageArray;
    NSMutableArray *latinNameArray;
    NSMutableArray *hardinessArray;
    NSMutableArray *droughtToleranceArray;
    NSMutableArray *nativeArray;
}

-(IBAction)onEdit:(id)sender;

@end
