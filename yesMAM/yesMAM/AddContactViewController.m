//
//  AddContactViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/15/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"

@interface AddContactViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;

@end

#pragma mark -

@implementation AddContactViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Configure the navigation bar
    self.navigationItem.title = @"Add Contact";
    
	[self.nameTextField becomeFirstResponder];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
	if (textField == self.nameTextField) {
		[self.nameTextField resignFirstResponder];
		[self save:self];
	}
	return YES;
}


- (IBAction)save:(id)sender {
    
    self.contact.name = self.nameTextField.text;
    
	NSError *error = nil;
	if (![self.contact.managedObjectContext save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
    
	[self.delegate addContactViewController:self didAddContact:self.contact];
}

- (IBAction)cancel:(id)sender {
	
	[self.contact.managedObjectContext deleteObject:self.contact];
    
	NSError *error = nil;
	if (![self.contact.managedObjectContext save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
    
    [self.delegate addContactViewController:self didAddContact:nil];
}

@end
