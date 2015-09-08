//
//  ViewController.m
//  FlowerApp
//
//  Created by Michelle Goldman on 2/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"
#import "FlowerFactory.h"
#import "Allamanda.h"
#import "Lantana.h"
#import "Snapdragon.h"

@interface ViewController ()

@end

@implementation ViewController




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

- (BOOL)shouldAutorotate:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //once the text field is selected the default text disappears
    textField.text = @"";
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return true;
}

//load InfoViewController
-(IBAction)showInfo:(id)sender;
{
    InfoViewController *InfoView = [[InfoViewController alloc]initWithNibName:@"InfoViewController" bundle:nil];
    if (InfoView != nil)
    {
        [self presentViewController:InfoView animated:true completion:nil];
    }
}

//display which flower was selected when pressing corresponding button
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag == 0)
        {
            lantanaButton.enabled = true;
            snapdragonButton.enabled = true;
            allamandaButton.enabled = false;
            flowerTextField.text = @"Allamanda selected";
        }
        else if (button.tag == 1)
        {
            snapdragonButton.enabled = true;
            allamandaButton.enabled = true;
            lantanaButton.enabled = false;
            flowerTextField.text =@"Lantana selected";
        }
        else if (button.tag == 2)
        {
            allamandaButton.enabled = true;
            lantanaButton.enabled = true;
            snapdragonButton.enabled = false;
            flowerTextField.text = @"Snapdragon selected";
        }
    }
}

//

//create stepper button
-(IBAction)runStepper:(id)sender
{
    UIStepper *stepControl = (UIStepper*)sender;
    if (stepControl != nil)
    {
        int currentValue = stepControl.value;
        flowerTextField.text = [NSString stringWithFormat:@" Quantity of %d", currentValue];
    }
}

//run calculation method for each flower once selected
-(IBAction)runCalc:(id)sender
{
    int currentNumber = stepperControl.value;
    
    if (allamandaButton.enabled == NO)
    {
        //create Allamanda flower label details
        Allamanda *allamandaDetails = (Allamanda*) [FlowerFactory SelectFlower:ALLAMANDA];
        if (allamandaDetails != nil)
        {
            [allamandaDetails setTimesDeadheaded:3];
            [allamandaDetails calculateBloomTime];
            int averageTime = allamandaDetails.timesDeadheaded * currentNumber;
            flowerTextField.text = [NSString stringWithFormat:@"Deadheading %i times yields %i months.",currentNumber, averageTime];
            lantanaButton.enabled = YES;
            snapdragonButton.enabled = YES;
        }
    }
    else if (lantanaButton.enabled == NO)
    {
        Lantana *lantanaDetails = (Lantana*) [FlowerFactory SelectFlower:LANTANA];
        if (lantanaDetails != nil)
        {
            [lantanaDetails setDraughtTolerance:4];
            [lantanaDetails calculateBloomTime];
            int averageTime = lantanaDetails.draughtTolerance * currentNumber;
            flowerTextField.text = [NSString stringWithFormat:@"Draught tolerance of %i yields %i months.",currentNumber, averageTime];
            allamandaButton.enabled = YES;
            snapdragonButton.enabled = YES;
        }
    }
    else if (snapdragonButton.enabled == NO)
    {
        Snapdragon *snapdragonDetails = (Snapdragon*) [FlowerFactory SelectFlower:SNAPDRAGON];
        if (snapdragonDetails != nil)
        {
            [snapdragonDetails setDraughtTolerance:2];
            [snapdragonDetails calculateBloomTime];
            int averageTime = snapdragonDetails.draughtTolerance * currentNumber;
            flowerTextField.text = [NSString stringWithFormat:@"Draught tolerance of %i yields %i months.",currentNumber, averageTime];
            allamandaButton.enabled = YES;
            snapdragonButton.enabled = YES;
        }
    }
}

//create segment control background color change
- (IBAction)changeBackground:(id)sender
{
    UISegmentedControl *changeBackgroundColor = (UISegmentedControl*)sender;
    if (changeBackgroundColor != nil)
    {
        if (changeBackgroundColor.selectedSegmentIndex == 0)
        {
            self.view.backgroundColor = [UIColor colorWithRed:1 green:0.6 blue:0.8 alpha:1];
        }
        else if (changeBackgroundColor.selectedSegmentIndex == 1)
        {
            self.view.backgroundColor = [UIColor colorWithRed:0.6 green:0.4 blue:0.6 alpha:1];
        }
        else if (changeBackgroundColor.selectedSegmentIndex == 2)
        {
            self.view.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:1 alpha:1];
        }    }
}

- (void)DidClose:(NSString *)nameString
{
    flowerLabel.text = nameString;
}
@end
