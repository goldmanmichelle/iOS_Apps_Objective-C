//
//  DetailViewController.h
//  YE2010
//
//  Created by Michelle Goldman on 3/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    
}
@property IBOutlet UIImageView *itemImage;
@property IBOutlet UILabel *titleLabel;
@property IBOutlet UITextView *detailsLabel;
@property IBOutlet UILabel *linkLabel;

-(IBAction)returnHome:(id)sender;
@end
