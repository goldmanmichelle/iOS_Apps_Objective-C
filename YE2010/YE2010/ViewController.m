//
//  ViewController.m
//  YE2010
//
//  Created by Michelle Goldman on 3/9/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //load name of tab bar button and corresponding header
        self.title = NSLocalizedString(@"Home", @"");
        self.tabBarItem.image = [UIImage imageNamed:@"homeIcon3"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
