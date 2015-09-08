//
//  ContactsTableViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/14/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "ContactDetailsViewController.h"
#import "ContactTableViewCell.h"
#import "Contact.h"

@interface ContactsTableViewController ()

//this controller is responsible for tying core data fetch requests to UITableView in iOS.
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation ContactsTableViewController


// segue ID when "+" button is tapped
static NSString *kShowDetailSegueID = @"showDetail";

// segue ID when "Add Ingredient" cell is tapped
static NSString *kAddContactSegueID = @"addContact";


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // add the table's edit button to the left side of the nav bar
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // Set the table view's row height
    self.tableView.rowHeight = 44.0;
    
    //Create an NSerror pointer, call the fetchedResultsController and then perform the fetch method passing in the address of the error object (&error), similar to creating a save
    NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		//abort();
	}
}


/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
#pragma mark - Contact Support

- (void)addContactViewController:(AddContactViewController *)addContactViewController didAddContact:(Contact *)contact
{
    
    if (contact)
    {
        // show the contact in the AddContactViewController
        [self performSegueWithIdentifier:kShowDetailSegueID sender:contact];
    }
    
    // dismiss the AddContactViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITableViewDataSource

//method to tell the table what to expect at the top of each section, since the info is being fecthed in sections. Method is tableView.
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //jump into the fetchedResultsController to get the section information that has the object "section" and find the property called "name". **NOTHING IS BEING EXECUTED HERE IN THE FETCH. THIS IS BEING DONE IN VIEWDIDLOAD**
    return [[[self.fetchedResultsController sections] objectAtIndex:section]name];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    //since the number of sections will vary, we simply ask the fetchedResultsController for the current count
    return [[self.fetchedResultsController sections] count];
    
    /*
    NSInteger count = [self.fetchedResultsController sections].count;
    
	if (count == 0)
    {
		count = 1;
	}
	
    return count;
     */
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // we're asking the fetchedResultsController for its section array & going into a particular one based on the objectAtIndex section parameter which will be called automatically for every section. Then the results are are given an ID of secInfo which must comply with the NSFetchedResultsSectionInfo protocol, which is why it's in angle brackets.
    id<NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    
    return [secInfo numberOfObjects];
    
    
    /*
    NSInteger numberOfRows = 0;
	
    if ([self.fetchedResultsController sections].count > 0)
    {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
    }
    
    return numberOfRows;
     */
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // dequeue a RecipeTableViewCell, then set its recipe to the recipe for the current row
    ContactTableViewCell *contactCell =
    (ContactTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    [self configureCell:contactCell atIndexPath:indexPath];
    
    return contactCell;
}

- (void)configureCell:(ContactTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
	Contact *contact = (Contact *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.contact = contact;
}

#pragma mark - UITableViewDelegate PrepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:kShowDetailSegueID])
    {
        // show/edit a contact's details
        ContactDetailsViewController *contactDetailsViewController = (ContactDetailsViewController *)segue.destinationViewController;
        
        Contact *contact = nil;
        if ([sender isKindOfClass:[Contact class]]) {
            // the sender is the actual contact sent from "didAddContact" delegate (user created a new contact)
            contact = (Contact *)sender;
        }
        else {
            // the sender is ourselves (user tapped an existing contact)
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            contact = (Contact *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        }
        contactDetailsViewController.contact = contact;
    }
    else if ([segue.identifier isEqualToString:kAddContactSegueID]) {
        // add a contact
        //
        Contact *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact"
                                                          inManagedObjectContext:self.managedObjectContext];
        
        UINavigationController *navController = segue.destinationViewController;
        AddContactViewController *addController = (AddContactViewController *)navController.topViewController;
        addController.delegate = self;  // do didAddContact delegate method is called when cancel or save are tapped
        addController.contact = newContact;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
		NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
		[context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
		
		// Save the context.
		NSError *error;
		if (![context save:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			//abort();
		}
	}
}



#pragma mark - Fetched Results Controller Section


- (NSFetchedResultsController *)fetchedResultsController {
    
    // Set up the fetched results controller if needed.
    if (_fetchedResultsController == nil) {
        // Create the fetch request for the entity.
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        // Edit the entity name as appropriate.
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        // Edit the sort key as appropriate.
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        // Edit the section name key path and cache name if appropriate.
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"name" cacheName:nil];
        
        
        // nil for section name key path means "no sections".
        NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"name" cacheName:@"Root"];
        aFetchedResultsController.delegate = self;
        self.fetchedResultsController = aFetchedResultsController;
      
    }
	
	return _fetchedResultsController;
}



//tell tableview we're making updates using the NSFetchedResultsController
-(void) controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


//make updates to NSFetchedResultsController
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    //first update
    UITableView *tableView = self.tableView;
    
    //
    switch (type) {
        //if there was an insert, tell tableview to insert a new row
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
         // if it's a delete, tell tableview to delete row
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
         //if it's an edit to a current contact, get the current tableview cell and change the cell's lastName
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        //handling movement of cells in the tableview
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
    
}
//handles the change of sections in the tableview
-(void) controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
            //was there an insert into the tableview, then insert new row
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            //was there a delete, if so delete the row
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

//tell tableview we're done making updates using the NSFetchedResultsController
-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - Search Bar
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    
    [searchBar resignFirstResponder];
    
}


@end
