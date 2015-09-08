//
//  MyNameViewController.m
//  Shopping List
//
//  Created by Michelle Goldman on 11/5/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "MyNameViewController.h"

@interface MyNameViewController ()

@end

@implementation MyNameViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Function that closes second view page
-(IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end