//
//  DeviceDetailViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/21/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "Contact.h"
#import "Device.h"
#import "EditingTableViewCell.h"

@interface DeviceDetailViewController ()

// table's data source
@property (nonatomic, strong) NSString *numberStr;
@property (nonatomic, strong) NSString *typeStr;
@property (nonatomic, strong) NSString *carrierStr;
@property (nonatomic, strong) NSDate *dateStr;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end


// view tags for each UITextField
#define kNumberFieldTag     1
#define kTypeFieldTag       2
#define kCarrierFieldTag    3
#define kDateFieldTag       4

static NSString *DevicesCellIdentifier = @"DevicesCell";


@implementation DeviceDetailViewController
//@synthesize datePicked, datePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Device";
    
    self.tableView.allowsSelection = NO;
	self.tableView.allowsSelectionDuringEditing = NO;
    
    //Prevents previous dates from being selected
    //datePicker.minimumDate = [NSDate date];
    //datePicked = datePicker.date;
}

- (void)createDateFormatter
{
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    
    [self.dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    //[self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

- (void)setDevice:(Device *)device
{
    
    _device = device;
    
    _numberStr = device.number;
    _typeStr = device.type;
    _carrierStr = device.carrier;
    _dateStr = device.date;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EditingTableViewCell *cell =
    (EditingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:DevicesCellIdentifier
                                                            forIndexPath:indexPath];
    if (indexPath.row == 0)
    {
        // cell device number
        cell.label.text = @"Number";
        cell.textField.text = self.numberStr;
        cell.textField.placeholder = @"Phone Number";
        cell.textField.tag = kNumberFieldTag;
    }
	else if (indexPath.row == 1)
    {
        // cell device type
        cell.label.text = @"Type";
        cell.textField.text = self.typeStr;
        cell.textField.placeholder = @"Device model";
        cell.textField.tag = kTypeFieldTag;
    }
    else if (indexPath.row == 2)
    {
        // cell device carrier
        cell.label.text = @"Carrier";
        cell.textField.text = self.carrierStr;
        cell.textField.placeholder = @"Wireless provider";
        cell.textField.tag = kCarrierFieldTag;
    }
    else if (indexPath.row == 3)
    {
        // cell device carrier
        cell.label.text = @"Contract End Date";
        
       // datePicked = datePicker.date;
       // static datePicker = (UIDatePicker*)sender;
       // if(datePicked != nil)
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"EEEE"];
        }
        //cell.textField.text = self.dateStr;
        cell.textField.placeholder = @"Enter device contract end date";
        cell.textField.tag = kDateFieldTag;
    }
    return cell;
}
/*
 //Change Date
 -(IBAction)onDateChange:(id)sender
 {
 
   datePicked = datePicker.date;
   datePicker = (UIDatePicker*)sender;
   if(datePicked != nil)
   {
      NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
      [dateFormatter setDateFormat:@"EEEE"];
   }
 
   datePicker.minimumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
 }
 
 //Record UIDatePicker changes
 -(IBAction)onChange:(id)sender
 {
    datePicker.minimumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
 }
 
 */

#pragma mark - Save and cancel

- (IBAction)save:(id)sender {
	
	NSManagedObjectContext *context = [self.contact managedObjectContext];
	
	// if there isn't an device object, create and configure one
    if (!self.device) {
        self.device = [NSEntityDescription insertNewObjectForEntityForName:@"Device"
                                                        inManagedObjectContext:context];
        [self.contact addDevicesObject:self.device];
		self.device.displayOrder = [NSNumber numberWithInteger:self.contact.devices.count];
    }
	
	// update the device from the values in the text fields
    EditingTableViewCell *cell;
	
    cell = (EditingTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    self.device.number = cell.textField.text;
	
    cell = (EditingTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    self.device.type = cell.textField.text;
    
    cell = (EditingTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    self.device.carrier = cell.textField.text;
    
   // cell = (EditingTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
   // self.device.date = cell.textField.text;
	
	// save the managed object context
	NSError *error = nil;
	if (![context save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate.
         You should not use this function in a shipping application, although it may be
         useful during development. If it is not possible to recover from the error, display
         an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		//abort();
	}
	
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    // editing has ended in one of our text fields, assign it's text to the right
    // ivar based on the view tag
    //
    switch (textField.tag)
    {
        case kNumberFieldTag:
            self.numberStr = textField.text;
            break;
            
        case kTypeFieldTag:
            self.typeStr = textField.text;
            break;
            
        case kCarrierFieldTag:
            self.carrierStr = textField.text;
            break;
            
        //case kDateFieldTag:
          //  self.dateStr = textField.text;
            //break;
    }
}

@end
