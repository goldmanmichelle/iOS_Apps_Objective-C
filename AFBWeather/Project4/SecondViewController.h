//
//  SecondViewController.h
//  Project4
//
//  Created by Michelle Goldman on 12/12/13.
//  Copyright (c) 2013 Michelle Goldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol viewXML <NSObject>

@required
- (NSString *)xmlDataString;


@end
@interface SecondViewController : UIViewController
{
    IBOutlet UITextView *textView;
    
    //Custom delegate
    id<viewXML> delegate;
}

@property (strong) id<viewXML> delegate;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) NSString *xmlText;
@end
