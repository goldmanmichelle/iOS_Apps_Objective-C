//
//  ResearchViewController.h
//  YE2010
//
//  Created by Michelle Goldman on 3/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_2010News;
    NSMutableArray *blurb;
    NSMutableArray *newsImage;
    NSMutableArray *newsURL;
}
@end
