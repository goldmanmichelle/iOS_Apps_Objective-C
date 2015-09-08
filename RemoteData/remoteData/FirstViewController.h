//
//  FirstViewController.h
//  remoteData
//
//  Created by Michelle Goldman on 3/22/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

//add UIWebviewDelegate so that backButton works properly. **make sure to hook up the delegate to File Owner
@interface FirstViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *webView;
    IBOutlet UIBarButtonItem *backButton;
}


-(IBAction)onClick: (id) sender;


@end
