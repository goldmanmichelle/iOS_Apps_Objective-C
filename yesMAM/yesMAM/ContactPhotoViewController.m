//
//  ContactPhotoViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ContactPhotoViewController.h"
#import "Contact.h"

@interface ContactPhotoViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

#pragma mark -


@implementation ContactPhotoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Photo";
    
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor blackColor];
    
    self.view = self.imageView;
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.imageView.image = [self.contact.image valueForKey:@"image"];
}

@end
