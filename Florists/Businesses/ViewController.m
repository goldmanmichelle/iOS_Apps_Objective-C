//
//  ViewController.m
//  Businesses
//
//  Created by Michelle Goldman on 3/17/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "AllBusinessesDetailViewController.h"
#import "MyMapAnnotation.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Florists Near Me", @"Florists Near Me");
        del = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    }
    return self;
}

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

//Tableview location items (local florists)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [del.locationArray count];
}


//Populate list of local florists
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [businessTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MyMapAnnotation *location = [del.locationArray objectAtIndex:indexPath.row];
    cell.textLabel.text = location.title;
    
    return cell;
}

//Display detail view of selected florist
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailsView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    
    //Shows detail view
    MyMapAnnotation *location = [del.locationArray objectAtIndex:indexPath.row];
    detailsView.location = location;
    [self presentViewController:detailsView animated:true completion:nil];

    
}

//When All Businesses button is clicked
-(IBAction)loadBusinesses:(id)sender
{
    AllBusinessesDetailViewController *BusinessesDetailView = [[AllBusinessesDetailViewController alloc]initWithNibName:@"AllBusinessesDetailView" bundle:nil];
    if (BusinessesDetailView != nil)
    {
        [self presentViewController:BusinessesDetailView animated:true completion:nil];
        
    }
}



@end
