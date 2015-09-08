//
//  ViewController.m
//  SFFlowers
//
//  Created by Michelle Goldman on 3/4/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //create list of items to display in tableview
    flowerArray = [[NSMutableArray alloc] initWithObjects:
                   @"Amaranth",
                   @"Blanket Flower",
                   @"Blue-Eyed Grass",
                   @"Cardboard Plant",
                   @"Cinnamon Fern",
                   @"Firespike",
                   @"Gazania",
                   @"Golden Shrimp",
                   @"Heliconia",
                   @"Jacobinia",
                   @"Kalanchoe",
                   @"Lion's Ear",
                   @"Milkweed",
                   @"PawPaw",
                   @"Pinecone Ginger",
                   @"Society Garlic",
                   @"Tickseed",
                   @"Voodoo Lily",
                   @"Wax Begonia",
                   @"Wishbone Flower", nil];
    
    //Images to display next to above items in tableview
    flowerImageArray = [[NSMutableArray alloc] initWithObjects:
                        @"AmaranthUS.png",
                        @"BlanketFlower.png",
                        @"BlueEyedGrass.png",
                        @"CardboardPlant.png",
                        @"CinnamonFern.png",
                        @"Firespike.png",
                        @"Gazania.png",
                        @"GoldenShrimpPlant.png",
                        @"Heliconia.png",
                        @"Jacobinia.png",
                        @"Kalanchoe.png",
                        @"LionsEar.png",
                        @"Milkweed.png",
                        @"PawPaw.png",
                        @"PineconeGinger.png",
                        @"SocietyGarlic.png",
                        @"Tickseed.png",
                        @"VoodooLily.png",
                        @"WaxBegonia.png",
                        @"WishboneFlower.png", nil];
    
    //Flower's Latin name to display in details view of second view controller
    latinNameArray = [[NSMutableArray alloc] initWithObjects:
                      @"Amaranth spp.",
                      @"Gaillardia pulchella",
                      @"Sisyrinchium angustifolium",
                      @"Zamia furfuracea",
                      @"Osmunda cinnamomea",
                      @"Odontonema strictum",
                      @"Gazania spp.",
                      @"Pachystachys lutea",
                      @"Heliconia spp.",
                      @"Justicia carnea",
                      @"Kalanchoe blossfeldiana",
                      @"Leonotis leonurus",
                      @"Asclepias spp.",
                      @"Asimina spp.",
                      @"Zingiber zerumbet",
                      @"Tulbaghia violacea",
                      @"Coreopsis spp.",
                      @"Amorphophallus spp.",
                      @"Begonia semperflorens",
                      @"Torenia fournieri", nil];
    
    //Flower's hardiness zone to display in details view of second view controller
    hardinessArray = [[NSMutableArray alloc] initWithObjects:
                      @"8-11",
                      @"8a-11",
                      @"8-11",
                      @"9b-11",
                      @"8-10",
                      @"8b-11",
                      @"8b-11",
                      @"9b-11",
                      @"10b-11",
                      @"8b-11",
                      @"10-11",
                      @"9-11",
                      @"variable",
                      @"8-10",
                      @"9-11",
                      @"8a-11",
                      @"8a-10b",
                      @"9-11",
                      @"8-11",
                      @"8-11", nil];
    
    //Flower's drought tolerance to display in details view of second view controller
    droughtToleranceArray = [[NSMutableArray alloc] initWithObjects:
                             @"medium",
                             @"high",
                             @"medium",
                             @"high",
                             @"low",
                             @"medium",
                             @"high",
                             @"low",
                             @"none",
                             @"low",
                             @"high",
                             @"high",
                             @"medium",
                             @"medium",
                             @"medium",
                             @"low",
                             @"high",
                             @"medium",
                             @"low",
                             @"low", nil];
    
    //Display whether flower is native or foreign to SFLA on custom table cell within main view controller tableview
    nativeArray = [[NSMutableArray alloc] initWithObjects:
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Native",
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Native",
                   @"Foreign",
                   @"Native",
                   @"Native",
                   @"Foreign", nil];
    
    [super viewDidLoad];
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//Create tableview/count items
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [flowerArray count];
}

//Configure Edit button for delete capabilities
-(IBAction)onEdit:(id)sender
{
    if (editButton.tag == 0)
    {
        //Changes edit button to done
        [flowerTableView setEditing:TRUE];
        [editButton setTitle:@"Done" forState:0];
        editButton.tag = 1;
    }
    else
    {
        //Changes edit button back to edit
        [flowerTableView setEditing:FALSE];
        [editButton setTitle:@"Edit" forState:0];
        editButton.tag = 0;
    }
    
}

//Set Delete Style
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//Configure Delete Mode
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //Remove data from the array
        [flowerArray removeObjectAtIndex:indexPath.row];
        //Remove line item from the tableview
        [flowerTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:TRUE];
    }
}

//Populate list of individual table cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellID = @"Cell";
    
    CustomTableCell *cell = [flowerTableView dequeueReusableCellWithIdentifier:CellID];
    
    if (cell == nil)
    {
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomTableCell class]])
            {
                cell = (CustomTableCell*)view;
                cell.flowerLabel.text = [flowerArray objectAtIndex:indexPath.row];
                cell.imageView.image = [UIImage imageNamed:[flowerImageArray objectAtIndex:indexPath.row]];
                cell.nativeLabel.text = [nativeArray objectAtIndex:indexPath.row];
            }
        }
    }
    
    
    return cell;
}


//Displays info of selected flower
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailsView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    
    if (detailsView != nil)
    {
        [self presentViewController:detailsView animated:true completion:nil];
        detailsView.flowerNameLabel.text = [flowerArray objectAtIndex:indexPath.row];
        detailsView.flower.image = [UIImage imageNamed:[flowerImageArray objectAtIndex:indexPath.row]];
        detailsView.latinLabel.text = [latinNameArray objectAtIndex:indexPath.row];
        detailsView.hardinessLabel.text = [hardinessArray objectAtIndex:indexPath.row];
        detailsView.droughtLabel.text = [droughtToleranceArray objectAtIndex:indexPath.row];
    }
}
@end
