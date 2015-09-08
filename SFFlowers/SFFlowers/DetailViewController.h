//
//  DetailViewController.h
//  SFFlowers
//
//  Created by Michelle Goldman on 3/4/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    
}

@property IBOutlet UIImageView *flower;
@property IBOutlet UILabel *flowerNameLabel;
@property IBOutlet UILabel *latinLabel;
@property IBOutlet UILabel *hardinessLabel;
@property IBOutlet UILabel *droughtLabel;

-(IBAction)goBackHome:(id)sender;
@end
