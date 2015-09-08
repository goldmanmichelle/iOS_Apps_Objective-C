//
//  LegalInfoViewController.h
//  yesMAM
//
//  Created by Michelle Goldman on 7/15/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LegalInfoViewController : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *legalScrollView;
    IBOutlet UITextView *legalTextView;
}
@end
