//
//  ContactUsViewController.h
//  yesMAM
//
//  Created by Michelle Goldman on 7/15/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *contactUsButton;

- (IBAction)sendEmail:(id)sender;

@end
