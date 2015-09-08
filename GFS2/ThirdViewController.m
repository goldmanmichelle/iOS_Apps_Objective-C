//
//  ThirdViewController.m
//  testApplication
//
//  Created by Michelle Goldman on 4/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//take survey button loads website
- (IBAction)takeSurvey:(id)sender
{
    //Takes you to the user servey
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://docs.google.com/forms/d/1IAjaJ7wSVD0In349rXyzvjsUb0U25bLcvZrPTZQZO6A/viewform"]];
}

@end
