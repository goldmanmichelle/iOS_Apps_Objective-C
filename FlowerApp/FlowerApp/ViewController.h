//
//  ViewController.h
//  FlowerApp
//
//  Created by Michelle Goldman on 2/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowerFactory.h"

@protocol InfoViewDelegate <NSObject>

@required
-(void)DidClose:(NSString*)nameString;

@end

@interface ViewController : UIViewController <UITextFieldDelegate, InfoViewDelegate>
{
    IBOutlet UIButton *allamandaButton;
    IBOutlet UIButton *lantanaButton;
    IBOutlet UIButton *snapdragonButton;
    
    IBOutlet UILabel *flowerLabel;

    IBOutlet UITextField *flowerTextField;
    
    IBOutlet UIStepper *stepperControl;
    IBOutlet UILabel *stepperLabel;

}
//create action to load info view controller
-(IBAction)showInfo:(id)sender;

//create action to display which flower was selected when pressing corresponding button
-(IBAction)onClick:(id)sender;

//create stepper button to increment
-(IBAction)runStepper:(id)sender;

//create calculation method to be run for each flower once selected
- (IBAction)runCalc:(id)sender;

//create segment control change
- (IBAction)changeBackground:(id)sender;

@end
