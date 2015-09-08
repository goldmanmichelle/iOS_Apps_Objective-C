//
//  SecondViewController.m
//  testApplication
//
//  Created by Michelle Goldman on 4/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    //create string of items to be displayed in item tableView
    itemName = [[NSMutableArray alloc] initWithObjects:
                 
                 @"GF Toufayan Wraps",
                 @"Udi's Cinnamon Raisin Bread",
                 @"Spinach and Kale Corn Chips",
                 @"Nature's Earthly Choice Quinoa",
                 @"The Ojai Cook Lemonaise",
                 @"White Bean Hummus",
                 @"Yellow Lentil Hummus",
                 @"Earth Balance Buttery Spread",
                 @"Bob's Red Mill TVP",
                 @"Davis Chocolate Powdered Peanut Butter",
                 @"Bolthouse Farms Carrot Juice",
                 @"SoYummi Whipped Dark Chocolate Pudding",
                 @"Rice Shreds Mozzarella Shredded Cheese",
                 @"Glutino English Muffins",
                 @"Tate's GF Choc Chip Cookies",
                 @"OKF Pineapple Aloe Juice",
                 @"Hemp Seeds",
                 @"Udi's Cranberry Granola",
                 @"Back to Nature Rice Crackers",
                 @"Mochi", nil];
    
    
    //Images
    itemImage = [[NSMutableArray alloc]initWithObjects:
                 
                 @"gfToufayanWraps2.png",
                 @"udisCinnamonRaisinBread2.png",
                 @"spinachKaleCornChips2.png",
                 @"naturesEarthlyChoiceQuinoa2.png",
                 @"ojaiCookLemonaise2.png",
                 @"whiteBeanHummus2.png",
                 @"yellowLentilHummus2.png",
                 @"earthBalanceButterySpread2.png",
                 @"bobsRedMillTvp2.png",
                 @"davisChocPeanutButter2.png",
                 @"bolthouseFarmsCarrotJuice2.png",
                 @"soyummiDarkChocPudding2.png",
                 @"riceShredsMozzCheese2.png",
                 @"glutinoEngMuffins2.png",
                 @"tatesGFChocChipCookies2.png",
                 @"okfPineappleAloeJuice2.png",
                 @"hempSeeds2.png",
                 @"udisCranberryGranola2.png",
                 @"backToNatureRiceCrackers3.png",
                 @"mochi2.png", nil];
    
    //Favorite or not a favorite
    itemLocation =[[NSMutableArray alloc]initWithObjects:
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Not a Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Not a Favorite",
               @"Favorite",
               @"Not a Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Favorite",
               @"Not a Favorite", nil];
    
    //Comments about each item
    itemNotes = [[NSMutableArray alloc]initWithObjects:
                @"Tastes just like other wraps. Only at Publix!",
                @"This bread is the bomb! Not like other gluten free breads.",
                @"Sounds weird; great flavor!",
                @"Alright for quinoa. Not the biggest fan.",
                @"Just as good as mayo. Find it at Whole Foods in the refrigerated section.",
                @"Delicious alternative to your every day hummus-at Living Green fresh market.",
                @"Delicious alternative to your every day hummus-at Living Green fresh market.",
                @"The only spread I've found with no gluten, soy or casein. Pick some up at Whole Foods.",
                @"Versatile textured vegetable protein that absorbs the flavor of anything.",
                @"I love to use in protein shakes. Awesome peanuty flavor. Find at the Living Green fresh market.",
                @"Not the best Bolthouse flavor I've tried. Available at most grocery stores.",
                @"Deep, rich chocolatey flavor. Only at Whole Foods in the dairy section.",
                @"Gets the job done but doesn't melt well at all.",
                @"OMG! The best gluten free muffins ever. Grab 'em at Whole Foods and sometimes Publix.",
                @"Delicious, light, crispy. Only at Albertson's-in the cookie aisle.",
                @"So light and refreshing with tiny bits of pulp.",
                @"Who knew they packed a wallop of protein in every serving. Add them to shakes, soups and salads.",
                @"Perfect with vanilla coconut milk yogurt.",
                @"Firm and flavorful, even by themselves!",
                @"Interesting rice-based product. Didn't enjoy the texture or taste.", nil];
    
    
    //Comments about each item
    itemStore = [[NSMutableArray alloc]initWithObjects:
                 @"Albertsons",
                 @"Fresh Market",
                 @"Aldis",
                 @"Aldis",
                 @"Fresh Market",
                 @"Living Green",
                 @"Fresh Market",
                 @"Winn Dixie",
                 @"Publix",
                 @"Whole Foods",
                 @"Living Green",
                 @"Publix",
                 @"Publix",
                 @"Fresh Market",
                 @"Winn Dixie",
                 @"Living Green",
                 @"Living Green",
                 @"Publix",
                 @"Aldis",
                 @"Winn Dixie", nil];
    
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
    return [itemName count];
}

//Allows delete
-(IBAction)onEdit:(id)sender
{
    if (editButton.tag == 0)
    {
        //Changes edit button to done
        [tableView3 setEditing:TRUE];
        [editButton setTitle:@"Done" forState:0];
        editButton.tag = 1;
    }
    else
    {
        //Changes edit button to delete
        [tableView3 setEditing:FALSE];
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
        [itemName removeObjectAtIndex:indexPath.row];
        [tableView3 deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}



@end
