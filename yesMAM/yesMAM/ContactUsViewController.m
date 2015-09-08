//
//  ContactUsViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 7/15/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init ContactUsViewController");
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendEmail:(id)sender
{
    //email subject
    NSString * subject = @"Mobile App - Email Correspondence";
    //email body
    NSString * body = @"I am writing you today from within my Yes M'AM mobile app.";
    //recipient(s)
    NSArray * recipients = [NSArray arrayWithObjects:@"contact@yesmam.com", nil];
    
    //create the MFMailComposeViewController
    MFMailComposeViewController * composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    [composer setSubject:subject];
    [composer setMessageBody:body isHTML:NO];
    //[composer setMessageBody:body isHTML:YES]; //if you want to send an HTML message
    [composer setToRecipients:recipients];
    
    //get the filepath from resources
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"emailLogo" ofType:@"png"];
    
    //read the file using NSData
    NSData * fileData = [NSData dataWithContentsOfFile:filePath];
    // Set the MIME type
    /*you can use :
     - @"application/msword" for MS Word
     - @"application/vnd.ms-powerpoint" for PowerPoint
     - @"text/html" for HTML file
     - @"application/pdf" for PDF document
     - @"image/jpeg" for JPEG/JPG images
     */
    NSString *mimeType = @"image/png";
    
    //add attachement
    [composer addAttachmentData:fileData mimeType:mimeType fileName:filePath];
    
    //present it on the screen
    [self presentViewController:composer animated:YES completion:NULL];
}

#pragma mark - MFMailComposeViewControllerDelegate methods
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
/*
- (IBAction)showEmailActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"What do you want to do with the file?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Delete it"
                                                    otherButtonTitles:@"Copy", @"Move", @"Duplicate", nil];
    
    
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
