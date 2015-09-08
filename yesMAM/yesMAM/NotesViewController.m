//
//  NotesViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "NotesViewController.h"
#import "Contact.h"

@interface NotesViewController ()

@property (nonatomic, strong) IBOutlet UITextView *notesText;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;

@end

#pragma mark -


@implementation NotesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Notes";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // Update the views appropriately
    self.nameLabel.text = self.contact.name;
    self.notesText.text = self.contact.notes;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    self.notesText.editable = editing;
	[self.navigationItem setHidesBackButton:editing animated:YES];
    
	/*
	 If editing is finished, update the recipe's instructions and save the managed object context.
	 */
	if (!editing) {
		self.contact.notes = self.notesText.text;
		
		NSManagedObjectContext *context = self.contact.managedObjectContext;
		NSError *error = nil;
		if (![context save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		}
	}		
}


@end
