//
//  DeviceDetailViewController.h
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

@class Contact, Device;

@interface DeviceDetailViewController : UITableViewController

@property (nonatomic, strong) Contact *contact;
@property (nonatomic, strong) Device *device;

@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) NSDate *datePicked;
@property (nonatomic, strong) NSString *formattedDate;

//-(IBAction)onDateChange:(id)sender;

@end
