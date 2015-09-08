//
//  DetailViewController.m
//  SFFlowers
//
//  Created by Michelle Goldman on 3/4/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize flower;
@synthesize flowerNameLabel;
@synthesize latinLabel;
@synthesize hardinessLabel;
@synthesize droughtLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Return to Home screen
-(IBAction)goBackHome:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
