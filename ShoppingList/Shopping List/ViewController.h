//
//  ViewController.h
//  Shopping List
//
//  Created by Michelle Goldman on 11/4/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shoppingFactory.h"


@interface ViewController : UIViewController 


{
    //Buttons
    IBOutlet UIButton *foodButton;
    IBOutlet UIButton *decorationsButton;
    IBOutlet UIButton *beveragesButton;
    IBOutlet UIButton *infoButton;
    IBOutlet UIButton *calcButton;
    IBOutlet UIStepper *stepper;
    IBOutlet UILabel  *label;

    //Text Field
    IBOutlet UITextField *textBox;
}

//Function calls
-(IBAction)onClick:(id)sender;
-(IBAction)colorSelect:(id)sender;
-(IBAction)stepper:(id)sender;
-(IBAction)onCalcClick:(id)sender;
-(IBAction)showInfoPage:(id)sender;


@end
