//
//  FirstViewController.m
//  testApplication
//
//  Created by Michelle Goldman on 4/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    //create string of items to be displayed in store tableView
    storeName = [[NSMutableArray alloc] initWithObjects:
                 
                 @"Albertsons",
                 @"Aldis",
                 @"Fresh Market",
                 @"Living Green",
                 @"Publix",
                 @"Whole Foods",
                 @"Winn Dixie", nil];
    
    
    //Images
    storeAddress = [[NSMutableArray alloc]initWithObjects:
                 
                 @"950 E Commercial Blvd., Ft. Lauderdale, FL 33334",
                 @"1707 E Commercial Blvd., Ft. Lauderdale, FL 33334",
                 @"424 N Federal Hwy., Ft. Lauderdale, FL 33301",
                 @"1305 E Commercial Blvd., Ft. Lauderdale, FL 33334",
                 @"10065 Cleary Blvd., Plantation, FL 33324",
                 @"7720 Peters Rd., Plantation, FL 33324",
                 @"901 N Nob Hill Rd., Plantation, FL 33324", nil];
    
    
  
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Count items in list
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [storeName count];
}

//Allows delete
-(IBAction)onEdit:(id)sender
{
    if (editButton.tag == 0)
    {
        //Changes edit button to done
        [tableView2 setEditing:TRUE];
        [editButton setTitle:@"Done" forState:0];
        editButton.tag = 1;
    }
    else
    {
        //Changes edit button to delete
        [tableView2 setEditing:FALSE];
        [editButton setTitle:@"Delete" forState:0];
        editButton.tag = 0;
    }
    
}

//Delete style
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//Delete Mode
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [storeName removeObjectAtIndex:indexPath.row];
        [tableView2 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}


//Populate list
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Stores Cell";
    
    UITableViewCell *cell = [tableView2 dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
   // storeName *store = [self.fetchedResultsController objectAtIndexPath:indexPath];
   // cell.textLabel.text = storeName.name;
    
    return cell;
}
/*
//Displays the info of selected item
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreDetailViewController *storeDetailView = [[StoreDetailViewController alloc] initWithNibName:@"StoreDetailViewController" bundle:nil];
    if (detailView != nil)
    {
        [self presentViewController:detailView animated:true completion:nil];
        storeDetailView.nameLbl.text = [listItems objectAtIndex:indexPath.row];
        storeDetailView.item.image = [UIImage imageNamed:[itemImage objectAtIndex:indexPath.row]];
        storeDetailView.favoriteLbl.text = [favorite objectAtIndex:indexPath.row];
        storeDetailView.commentsLbl.text = [comments objectAtIndex:indexPath.row];
    }
}
*/
@end
