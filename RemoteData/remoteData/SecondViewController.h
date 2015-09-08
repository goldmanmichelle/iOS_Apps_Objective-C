//
//  SecondViewController.h
//  remoteData
//
//  Created by Michelle Goldman on 3/22/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SecondViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>


{
    IBOutlet UITextView *webTextView;
    
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    
    //object that will contain the data that is being pulled down from the website
    NSMutableData *requestData;
}


@end
