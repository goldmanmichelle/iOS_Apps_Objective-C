//
//  OptionsTableViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 7/14/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "OptionsTableViewController.h"
#import "AboutViewController.h"
#import "FunFactsViewController.h"
#import "HelpSupportViewController.h"
#import "ContactUsViewController.h"
#import "AppFeedbackViewController.h"
#import "LegalInfoViewController.h"

@interface OptionsTableViewController ()

@end

@implementation OptionsTableViewController

// table's section indexes
#define ABOUT_SECTION    0
#define FACTS_SECTION    1
#define HELP_SECTION     2
#define CONTACT_SECTION  3
#define FEEDBACK_SECTION 4
#define LEGAL_SECTION    5

// segue ID when "About" cell is tapped
static NSString *kAboutViewSegueID = @"AboutView";

// segue ID when "Fun Facts" cell is tapped
static NSString *kFunFactsViewSegueID = @"FunFactsView";

// segue ID when the "Help" cell is tapped
static NSString *kHelpSupportViewSegueID = @"HelpSupportView";

// segue ID when the "Contact Us" cell is tapped
static NSString *kContactUsViewSegueID = @"ContactUsView";

// segue ID when the "Contact Us" cell is tapped
static NSString *kAppFeedbackViewSegueID = @"AppFeedbackView";

// segue ID when the "Contact Us" cell is tapped
static NSString *kLegalInfoViewSegueID = @"LegalInfoView";

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSInteger rows = 0;
  
    switch (section)
    {
        case ABOUT_SECTION:
            rows = 1;
            //break;
        case FACTS_SECTION:
            rows = 1;
            //break;
        case HELP_SECTION:
            rows = 1;
           // break;
        case CONTACT_SECTION:
            rows = 1;
           // break;
        case FEEDBACK_SECTION:
            rows = 1;
           // break;
        case LEGAL_SECTION:
            rows = 1;
           // break;

        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    UITableViewCell *cell = nil;
  
    if (indexPath.section == ABOUT_SECTION)
    {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"AboutCellIdentifier" forIndexPath:indexPath];

    }
    else
    {
        switch (indexPath.section)
        {
            case FACTS_SECTION:
                cell = [tableView dequeueReusableCellWithIdentifier:@"FunFactsCellIdentifier" forIndexPath:indexPath];
                break;
                
            case HELP_SECTION:
                cell = [tableView dequeueReusableCellWithIdentifier:@"HelpSupportCellIdentifier" forIndexPath:indexPath];
                break;
                
            case CONTACT_SECTION:
                cell = [tableView dequeueReusableCellWithIdentifier:@"ContactUsCellIdentifier" forIndexPath:indexPath];
                break;
                
            case FEEDBACK_SECTION:
                cell = [tableView dequeueReusableCellWithIdentifier:@"AppFeedbackCellIdentifier" forIndexPath:indexPath];
                break;
                
            case LEGAL_SECTION:
                cell = [tableView dequeueReusableCellWithIdentifier:@"LegalInfoCellIdentifier" forIndexPath:indexPath];
                break;
                
            default:
                break;
        }
    }
    
    //add else statement for the requests view
 
    return cell;
}

 /*

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

  
    
    if ([segue.identifier isEqualToString:kAboutViewSegueID])
    {
        
        
        UIViewController *aboutViewController = segue.destinationViewController;
        aboutViewController.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:aboutViewController animated:YES completion:nil];
    }
    else if ([segue.identifier isEqualToString:kFunFactsViewSegueID])
    {
        UIViewController *funFactsViewController = segue.destinationViewController;
        funFactsViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:funFactsViewController animated:YES completion:nil];
    }
   
    else if ([segue.identifier isEqualToString:kHelpSupportViewSegueID])
    {
        UIViewController *helpSupportViewController = segue.destinationViewController;
        helpSupportViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:helpSupportViewController animated:YES completion:nil];

    }
    else if ([segue.identifier isEqualToString:kContactUsViewSegueID])
    {
        UIViewController *contactUsViewController = segue.destinationViewController;
        contactUsViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:contactUsViewController animated:YES completion:nil];

    }
    else if ([segue.identifier isEqualToString:kAppFeedbackViewSegueID])
    {
        UIViewController *appFeedbackViewController = segue.destinationViewController;
        appFeedbackViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:appFeedbackViewController animated:YES completion:nil];
  
    }
    else if ([segue.identifier isEqualToString:kLegalInfoViewSegueID])
    {
        UIViewController *legalInfoViewController = segue.destinationViewController;
        legalInfoViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:legalInfoViewController animated:YES completion:nil];
        
     


    }
     
    
}
*/

@end
