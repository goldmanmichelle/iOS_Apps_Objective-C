//
//  AddContactViewController.h
//  yesMAM
//
//  Created by Michelle Goldman on 6/15/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//


@protocol AddContactViewControllerDelegate;

@class Contact;

@interface AddContactViewController : UIViewController

@property (nonatomic, strong) Contact *contact;
@property (nonatomic, unsafe_unretained) id <AddContactViewControllerDelegate> delegate;

@end

#pragma mark -

@protocol AddContactViewControllerDelegate <NSObject>

// contact == nil on cancel
- (void)addContactViewController:(AddContactViewController *)addContactViewController didAddContact:(Contact *)contact;

@end


