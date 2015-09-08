//
//  FeedsViewController.h
//  YE2010
//
//  Created by Michelle Goldman on 3/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedsViewController : UIViewController
{
    IBOutlet UIButton *resources;
    IBOutlet UITextView *additionalResources;
}

@property (nonatomic, retain)NSMutableDictionary *disasterList;

- (IBAction)loadResources:(id)sender;


@end
