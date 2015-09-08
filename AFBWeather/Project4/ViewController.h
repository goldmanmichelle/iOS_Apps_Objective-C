//
//  ViewController.h
//  Project4
//
//  Created by Michelle Goldman on 12/12/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"



@interface ViewController : UIViewController <NSURLConnectionDataDelegate, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate, UITabBarControllerDelegate, viewXML>
{
    IBOutlet UITableView *tableView2;
    NSURL *url;
    NSURLRequest *request;
    NSURLConnection *connection;
    NSMutableData *requestData;
    NSArray *cities;
    NSArray *listTitles;
    NSArray *weatherLocales;
    NSString *currentCity;
    NSString *location;
    NSString *station;
    NSString *lon;
    NSString *lat;
    NSString *visibility;
    NSString *conditions;
    NSString *temp;
    NSString *humidity;
    NSString *wind;
    NSString *pressure;
    NSString *currentElement;
    NSString *requestString;
    
    BOOL parseController;
}


-(void)callDetailView:(NSString *)details;
-(void)getXML:(NSString *)urlToXML;
-(IBAction)onClick:(id)sender;



@property (nonatomic, strong) IBOutlet UITableView *tableView2;
@property (nonatomic, strong) NSString *xmlDataString;

@end
