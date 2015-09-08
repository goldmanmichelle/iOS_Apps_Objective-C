//
//  SecondViewController.m
//  remoteData
//
//  Created by Michelle Goldman on 3/22/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    //create URL
    url = [[NSURL alloc] initWithString:@"http://www.thetoptens.com/websites/"];
    
    //create request that will be sent to the server
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        //create mutable data object (requestData)
        requestData = [NSMutableData data];
    }
 
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //verification of valid data
    if (data != nil)
    {
        //add  this new data to existing data
        [requestData appendData:data];
    }
}

//function called when all data has been pulled down from the url
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //convert the information being pulled down from the website url using the request into a string that can be viewed
    //create NSString
    NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    if (requestString != nil)
    {
        webTextView.text  = [[NSString alloc] initWithFormat:@"%@/%@", requestString, @"index.html"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
