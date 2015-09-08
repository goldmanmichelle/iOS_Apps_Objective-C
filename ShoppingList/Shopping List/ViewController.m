//
//  ViewController.m
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"
#import "MyNameViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//Change background color to white
-(void)viewDidAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Function for buttons
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button == foodButton)
    {
        foodButton.enabled = false;
        decorationsButton.enabled = true;
        beveragesButton.enabled = true;
        textBox.text = @"Let's shop for food.";
    }
    else if (button == decorationsButton)
    {
        decorationsButton.enabled = false;
        foodButton.enabled = true;
        beveragesButton.enabled = true;
        textBox.text = @"Let's shop for decorations.";
    }
    else if (button == beveragesButton)
    {
        beveragesButton.enabled = false;
        foodButton.enabled = true;
        decorationsButton.enabled = true;
        textBox.text = @"Let's shop for beverages.";
    }
    
}

//Stepper function
-(IBAction)stepper:(id)sender
{
    UIStepper *stepperControl = (UIStepper*)sender;
    if (stepperControl != nil)
    {
        int stepValue = stepperControl.value;
        
        label.text = [NSString stringWithFormat:@"%d Items", stepValue];
    }
}
//Calculation function
-(IBAction)onCalcClick:(id)sender
{
    int stepNum = stepper.value;
    
    if (foodButton.enabled == NO)
    {
        //Creating food list details
        foodList *flist = (foodList*)[shoppingFactory goShopping:FOOD];
        if (flist != nil)
        {
            [flist setNumberOfItems:10];
            [flist calcShopTime];
            int timePerStore = flist.numberOfItems * stepNum;
            textBox.text = [NSString stringWithFormat:@"Buying  %i items will take %i minutes.", stepNum, timePerStore];
            decorationsButton.enabled = YES;
            beveragesButton.enabled = YES;
        }
    }
    else if (decorationsButton.enabled == NO)
    {
        //Creating decorations list details
        decorList *dlist = (decorList*)[shoppingFactory goShopping:DECORATIONS];
        if (dlist != nil)
        {
            [dlist setNumberOfItems:7];
            [dlist calcShopTime];
            int timePerStore = dlist.numberOfItems * stepNum;
            textBox.text = [NSString stringWithFormat:@"Buying %i items will take %i minutes.", stepNum, timePerStore];
            foodButton.enabled = YES;
            beveragesButton.enabled = YES;
        }
    }
    else if (beveragesButton.enabled == NO)
    {
        //Creating beverages list details
        bevList *blist = (bevList*)[shoppingFactory goShopping:BEVERAGES];
        if (blist != nil)
        {
            [blist setNumberOfItems:7];
            [blist calcShopTime];
            int timePerStore = blist.numberOfItems * stepNum;
            textBox.text = [NSString stringWithFormat:@"Buying %i items will take %i minutes.", stepNum, timePerStore];
            foodButton.enabled = YES;
            decorationsButton.enabled = YES;
        }
    }
}
//Change background colors
-(IBAction)colorSelect:(id)sender
{
    UISegmentedControl *colorChangerControl = (UISegmentedControl*)sender;
    if (colorChangerControl != nil)
    {
        if (colorChangerControl.selectedSegmentIndex == 0)
        {
            self.view.backgroundColor = [UIColor colorWithRed:0.91 green:0.804 blue:0.663 alpha:1];
        }
        else if (colorChangerControl.selectedSegmentIndex == 1)
        {
            self.view.backgroundColor = [UIColor colorWithRed:0.392 green:0.62 blue:0.337 alpha:1];
        }
        else if (colorChangerControl.selectedSegmentIndex == 2)
        {
            self.view.backgroundColor = [UIColor colorWithRed:0.173 green:0.82 blue:1 alpha:1];
        }
    }
}
//Info button to view second view info page
-(IBAction)showInfoPage:(id)sender
{
    MyNameViewController *MyNameView = [[MyNameViewController alloc]initWithNibName:@"MyNameViewController" bundle:nil];
    if (MyNameView != nil)
    {
        [self presentViewController:MyNameView animated:true completion:nil];
    }
}

@end





