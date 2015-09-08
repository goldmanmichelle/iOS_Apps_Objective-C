//
//  ResearchViewController.m
//  YE2010
//
//  Created by Michelle Goldman on 3/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ResearchViewController.h"
#import "DetailViewController.h"


@interface ResearchViewController ()

@end

@implementation ResearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //load name of tab bar button and corresponding header
        self.title = NSLocalizedString(@"Research", @"Research");
        self.tabBarItem.image = [UIImage imageNamed:@"info-1"];
    }
    return self;
}

- (void)viewDidLoad
{
    //News Titles
    _2010News = [[NSMutableArray alloc] initWithObjects:
                @"Chile Earthquake",
                @"Eyjafjallajokull Glacier",
                @"Gulf Oil Spill",
                @"Haiti Earthquake",
                @"Indonesian Volcano",nil];
    
    //News Images
    newsImage = [[NSMutableArray alloc] initWithObjects:
                @"chileEarthquake.png",
                @"eyjafjallajokullGlacier.png",
                @"gulfOilSpill.png",
                @"haitiEarthquake.png",
                @"indonesiaVolcano.png", nil];
    
    //News Blurbs
    blurb = [[NSMutableArray alloc] initWithObjects:
             @"In this March 4, 2010 file photo, boats lay among damaged homes in Dichato, Chile. An 8.8-magnitude earthquake struck central Chile. (AP Photo/Natacha Pisarenko, File)",
             @"In this April 16, 2010 file photo, the volcano in southern Iceland's Eyjafjallajokull glacier sends ash into the air just prior to sunset.(AP Photo/Brynjar Gauti, File)",
             @"In this June 3, 2010 file photo, a brown pelican is seen on the beach at East Grand Terre Island along the Louisiana coast. (AP Photo/Charlie Riedel, File)",
             @"In this Feb. 11, 2010 file photo, a woman walks downtown in earthquake-torn Port-au-Prince. (AP Photo/Rodrigo Abd, File)",
             @"In this Nov. 1, 2010 file photo, Mount Merapi spews volcanic smoke as seen from Deles, Indonesia. (AP Photo/Irwin Fedriansyah, File)", nil];
    
    
    //News URLs
    newsURL = [[NSMutableArray alloc] initWithObjects:
                   @"http://classic.apimages.com/OneUp.aspx?st=det&kw=YE&id=615328&ids=YE%20Chile%20Earthquake&showact=details&sort=date&sh=14&dtebf=12%2F31%2F2010&dteaf=1%2F1%2F2010&kwstyle=and&adte=1394407342&moid=238205&pagez=60&cfasstyle=AND&rids=06a0f43332a04a8a9c68b1eb7074338d&dbm=PY2010&page=1&xslt=1&mediatype=Photo",
                   @"http://classic.apimages.com/OneUp.aspx?st=det&kw=YE&id=615328&ids=Disastrous%20Year%20YE&showact=details&sort=date&sh=14&dtebf=12%2F31%2F2010&dteaf=1%2F1%2F2010&kwstyle=and&adte=1394407342&moid=238205&pagez=60&cfasstyle=AND&rids=1cf2ffbae5714ec4b720e1485e02542e&dbm=PY2010&page=1&xslt=1&mediatype=Photo",
                   @"http://classic.apimages.com/OneUp.aspx?st=det&kw=YE&id=615328&ids=YE%20Gulf%20Oil%20Spill&showact=details&sort=date&sh=14&dtebf=12%2F31%2F2010&dteaf=1%2F1%2F2010&kwstyle=and&adte=1394407342&moid=238205&pagez=60&cfasstyle=AND&rids=dedd8f9324e842fa9c43439cf13b6a24&dbm=PY2010&page=1&xslt=1&mediatype=Photo",
                   @"http://classic.apimages.com/OneUp.aspx?st=det&kw=YE&id=615328&ids=YE%20Haiti%20Earthquake&showact=details&sort=date&sh=14&dtebf=12%2F31%2F2010&dteaf=1%2F1%2F2010&kwstyle=and&adte=1394407342&moid=238205&pagez=60&cfasstyle=AND&rids=a9e44b9d83fe45839306c8c1f787b947&dbm=PY2010&page=1&xslt=1&mediatype=Photo",
                   @"http://classic.apimages.com/OneUp.aspx?st=det&kw=YE&id=615328&ids=YE%20Indonesia%20Disasters&showact=details&sort=date&sh=14&dtebf=12%2F31%2F2010&dteaf=1%2F1%2F2010&kwstyle=and&adte=1394407342&moid=238205&pagez=60&cfasstyle=AND&rids=d69da22603234eb888740e303efca73a&dbm=PY2010&page=1&xslt=1&mediatype=Photo", nil];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Count news items in tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_2010News count];
}

//Load info from _2010News array into each cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"CellItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    cell.textLabel.text = [_2010News objectAtIndex:indexPath.row];
    return cell;
}

//Populate each news cell fields with title, picture, blurb and URL
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *articleDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    if (articleDetailView != nil)
    {
        [self presentViewController:articleDetailView animated:true completion:nil];
        
        articleDetailView.titleLabel.text = [_2010News objectAtIndex:indexPath.row];
        articleDetailView.itemImage.image = [UIImage imageNamed:[newsImage objectAtIndex:indexPath.row]];
        articleDetailView.detailsLabel.text = [blurb objectAtIndex:indexPath.row];
        articleDetailView.linkLabel.text = [newsURL objectAtIndex:indexPath.row];
    }
}



@end
