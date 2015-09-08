//
//  DetailViewController.h
//  Project4
//
//  Created by Michelle Goldman on 12/14/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UITextView *theTextView;
    IBOutlet UILabel *titleLabel;
    
    NSString *text;
    NSString *cityText;
}

-(IBAction)onClick:(id)sender;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *cityText;
@property (nonatomic, strong) IBOutlet UITextView *theTextView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@end
