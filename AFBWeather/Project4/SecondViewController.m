//
//  SecondViewController.m
//  Project4
//
//  Created by Michelle Goldman on 12/12/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize delegate, textView, xmlText;

//Create tabBar button info/image
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"XML Data", @"XML Data");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}


- (void)viewDidLoad
{
    //Display raw XML data
    self.textView.text = self.xmlText;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
