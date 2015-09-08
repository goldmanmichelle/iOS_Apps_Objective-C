//
//  LocationSelectionViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "LocationSelectionViewController.h"
#import "Contact.h"


@interface LocationSelectionViewController ()


@property (nonatomic, strong) NSArray *contactLocations; //same term as data model entity ContactLocation except lowercase "C"

@end

#pragma mark -

@implementation LocationSelectionViewController


static NSString *LocationIdentifier = @"LocationIdentifier";

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
	self.title = @"Site";
    
    // right bar button item will dismiss this view controller
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(doneAction:)];
    
    
    // fetch the location types in alphabetical order by name from the contact's context
	NSManagedObjectContext *context = [self.contact managedObjectContext];
	
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
	[fetchRequest setEntity:[NSEntityDescription entityForName:@"ContactLocation" inManagedObjectContext:context]];
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
	[fetchRequest setSortDescriptors:sortDescriptors];
    NSArray *locations = [context executeFetchRequest:fetchRequest error:nil];
	self.contactLocations = locations;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    
    /*
    //create string of items to be displayed in tableView
    locationList = [[NSMutableArray alloc] initWithObjects:
                 
                 @"Camp Pendelton",
                 @"Conrad",
                 @"Flagler Village",
                 @"El Paso",
                 @"Harborside",
                 @"Hawaii",
                 @"Main Office",
                 @"Margaritaville",
                 @"North Carolina",
                 @"South Carolina Office",
                 @"Via Mizner", nil];
    */
    // register this class for our cell to this table view under the specified identifier 'LocationIdentifier'
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:LocationIdentifier];
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

- (IBAction)doneAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Number of rows is the number of location types
    return self.contactLocations.count;
    //return [locationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LocationIdentifier forIndexPath:indexPath];
    
    // Configure the cell
	NSManagedObject *contactLocation = [self.contactLocations objectAtIndex:indexPath.row];
    cell.textLabel.text = [contactLocation valueForKey:@"name"];
    
    if (contactLocation == self.contact.location) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
    // If there was a previous selection, unset the accessory view for its cell.
	NSManagedObject *currentLocation = self.contact.location;
	
    if (currentLocation != nil) {
		NSInteger index = [self.contactLocations indexOfObject:currentLocation];
		NSIndexPath *selectionIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
        UITableViewCell *checkedCell = [tableView cellForRowAtIndexPath:selectionIndexPath];
        checkedCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Set the checkmark accessory for the selected row.
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    // Update the type of the location instance
    self.contact.location = [self.contactLocations objectAtIndex:indexPath.row];
    
    // Deselect the row.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
