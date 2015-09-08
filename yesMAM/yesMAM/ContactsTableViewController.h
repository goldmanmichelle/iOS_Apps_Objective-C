//
//  ContactsTableViewController.h
//  yesMAM
//
//  Created by Michelle Goldman on 6/14/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "AddContactViewController.h"

//add support for AddContactViewController by importing and adding delegate in angle brackets
@interface ContactsTableViewController : UITableViewController <AddContactViewControllerDelegate, NSFetchedResultsControllerDelegate, UISearchBarDelegate>

//property allows access to NSManagedObject Save & Fetch within AppDelegate
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;

@end
