//
//  NewRequestViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/16/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "NewRequestViewController.h"

@interface NewRequestViewController ()

@end

@implementation NewRequestViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Save & Cancel methods
- (IBAction)cancel:(id)sender
{
    //dismiss and remove the object
    //[self.delegate addContactViewControllerDidCancel:[self currentContact]];
}


- (IBAction)save:(id)sender
{
    //dismiss and remove the object
    //[self.delegate addContactViewControllerDidCancel:[self currentContact]];
}
@end
