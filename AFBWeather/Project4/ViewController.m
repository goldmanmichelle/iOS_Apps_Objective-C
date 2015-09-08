//
//  ViewController.m
//  Project4
//
//  Created by Michelle Goldman on 12/12/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

//typedef for didSelectRow
typedef enum
{
    LOCATION = 0,
    STATIONID,
    LONGITUDE,
    LATITUDE,
    VISIBILITY,
    CONDITIONS,
    TEMPERATURE,
    HUMIDITY,
    WIND,
    PRESSURE
} xmlListData;

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView2, xmlDataString;

//Create tabBar button info/image
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Weather", @"Weather");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}


//SecondView Controller tabBar
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //Prevent app from crashing
    if ([viewController isKindOfClass:[SecondViewController class]])
    {
        SecondViewController *SecondView = (SecondViewController *)viewController;
        SecondView.xmlText = self.xmlDataString;
    }
    return YES;
}

- (void)viewDidLoad
{
    self.tabBarController.delegate = self;
    
    //Create tableview
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 380) style:UITableViewStylePlain];
    
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [self.view addSubview:self.tableView2];
    
    //Init the weather locales object locations with XML weather feed
    weatherLocales = [[NSArray alloc] initWithObjects:@"http://w1.weather.gov/xml/current_obs/PAED.xml", @"http://w1.weather.gov/xml/current_obs/PWAK.xml", nil];
    
    //Titles for tableview
    listTitles = [[NSArray alloc] initWithObjects:@"Location", @"Station ID", @"Longitude", @"Latitude", @"Visibility", @"Conditions", @"Temperature", @"Humidity", @"Wind", @"Pressure", nil];
    
    //Cities array
    cities = [[NSArray alloc] initWithObjects:@"Anchorage Air Force Base", @"Wake Island Airfield", nil];
    
    //Set starting city
    currentCity = [cities objectAtIndex:0];
    
    //Fetch XML data and parse it
    [self getXML:[weatherLocales objectAtIndex:0]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Update the objects with the targeted XML data
-(void)getXML:(NSString *)urlToXML
{
    url = [[NSURL alloc] initWithString:urlToXML];
    if (url != nil)
    {
        request = [[NSURLRequest alloc] initWithURL:url];
        if (request != nil)
        {
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        }
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //If the data is not nil request data
    if (data != nil)
    {
        if (requestData)
        {
            [requestData appendData:data];
        }
        else
        {
            //If data is nil create request data
            requestData = [data mutableCopy];
        }
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Convert data to a string
    requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    
    xmlDataString = requestString;
    
    
    //Create the NSXMLParser object
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:requestData];
    if (parser != nil)
    {
        [parser setDelegate:self];
        
        //Parse XML
        [parser parse];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //Resets the parseController
    parseController = false;
    //Sets the currentElement to elementName
    currentElement = elementName;
}

//Get the xml data that is stored in between the tags
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (parseController == false)
    {
        //Set to true to prevent dual parsing
        parseController = true;
        
        if ([currentElement isEqualToString:@"location"])
        {
            location = [[NSString alloc] initWithFormat:@"Location: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"station_id"])
        {
            station = [[NSString alloc] initWithFormat:@"Station ID: %@", string];
        }
        else if ([currentElement isEqualToString: @"latitude"])
        {
            lat = [[NSString alloc] initWithFormat:@"Latitude: %@", string];
        }
        else if ([currentElement isEqualToString: @"longitude"])
        {
            lon = [[NSString alloc] initWithFormat:@"Longitude: %@", string];
        }
        else if ([currentElement isEqualToString: @"visibility_mi"])
        {
            visibility = [[NSString alloc] initWithFormat:@"Visibility: %@ miles", string];
        }
        else if ([currentElement isEqualToString: @"weather"])
        {
            conditions = [[NSString alloc] initWithFormat:@"Weather: %@", string];
        }
        else if ([currentElement isEqualToString: @"temperature_string"])
        {
            temp = [[NSString alloc] initWithFormat:@"Temperature: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"relative_humidity"])
        {
            humidity = [[NSString alloc] initWithFormat:@"Humidity: %@ %%", string];
        }
        else if ([currentElement isEqualToString: @"wind_string"])
        {
            wind = [[NSString alloc] initWithFormat:@"Wind: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"pressure_string"])
        {
            pressure = [[NSString alloc] initWithFormat:@"Pressure: %@", string];
        }
    }
}

//When item in table view is clicked xml data will be presented
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case LOCATION:
            [self callDetailView:location];
            break;
            
        case STATIONID:
            [self callDetailView:station];
            break;
            
        case LONGITUDE:
            [self callDetailView:lon];
            break;
            
        case LATITUDE:
            [self callDetailView:lat];
            break;
            
        case VISIBILITY:
            [self callDetailView:visibility];
            break;
            
        case CONDITIONS:
            [self callDetailView:conditions];
            break;
            
        case TEMPERATURE:
            [self callDetailView:temp];
            break;
            
        case HUMIDITY:
            [self callDetailView:humidity];
            break;
            
        case WIND:
            [self callDetailView:wind];
            break;
            
        case PRESSURE:
            [self callDetailView:pressure];
            break;
            
        default:
            break;
    }
}

//Detail View
-(void)callDetailView:(NSString *)details
{
    DetailViewController *detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    detailView.text = details;
    
    detailView.cityText = currentCity;
    
    [self presentViewController:detailView animated:true completion:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Return the number of objects in the listTitles array
    return [listTitles count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
    UITableViewCell *cell = [tableView2 dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [listTitles objectAtIndex:indexPath.row];
    
    return  cell;
}

//For the Anchorage and Wake Island bar buttons
-(IBAction)onClick:(id)sender
{
    UITabBarItem *item = (UITabBarItem *)sender;
    if (item != nil)
    {
        requestData = nil;
        
        currentCity = [cities objectAtIndex:item.tag];
        
        [self getXML:[weatherLocales objectAtIndex:item.tag]];
    }
}

//Callback from custom delegate
- (NSString *)xmlDataString
{
    return requestString;
}



@end
