//
//  FirstViewController.m
//  remoteData
//
//  Created by Michelle Goldman on 3/22/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    //load web page
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.thetoptens.com/websites/"];
    if (url != nil)
    {
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        if (request != nil)
        {
            //stop web page from going back any further if there is no page to go to
            if (!webView.canGoBack)
            {
                backButton.enabled = false;
            }
            //ensure web page content fits on device page
            webView.scalesPageToFit = true;
            [webView loadRequest:request];
        }
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


//allows user to have access to back button when applicable and it will be grayed out when not applicable
- (void)webViewDidFinishLoad:(UIWebView *)webView2
{
    backButton.enabled = (webView2.canGoBack);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//method to choose back, stop or reload buttons
-(IBAction)onClick: (id) sender
{
    UIBarButtonItem *item = (UIBarButtonItem*)sender;
    if (item != nil)
    {
        //back button takes you to previous page
        if (item.tag == 0)
        {
            if (webView.canGoBack)
            {
                [webView goBack];
                
                //check to make sure this is true and being pulled from cache
                backButton.enabled = (webView.canGoBack);

            }
        }
        //stop button stops current page from loading
        else if (item.tag == 1)
        {
            if (webView.isLoading)
            {
                [webView stopLoading];
            }
        }
        //reload webpage
        else if (item.tag == 2)
        {
            [webView reload];
        }
    }
}




@end
