//
//  ContactDetailsViewController.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/19/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ContactDetailsViewController.h"

#import "Contact.h"
#import "Device.h"

#import "NotesViewController.h"
#import "LocationSelectionViewController.h"
#import "ContactPhotoViewController.h"
#import "DeviceDetailViewController.h"
#import "DeviceTypeSelectionViewController.h"
#import "CarrierSelectionViewController.h"

@interface DeviceCell : UITableViewCell
@end

@implementation DeviceCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{ return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]; }
@end

#pragma mark -

@interface ContactDetailsViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *devices;

@property (nonatomic, strong) IBOutlet UIView *tableHeaderView;
@property (nonatomic, strong) IBOutlet UIButton *photoButton;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *titleTextField;
@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UIDatePicker *contractDatePicker;

@property (assign) BOOL singleEdit; // allows user to swipe-delete a specific device

- (void)updatePhotoButton;

@end


#pragma mark -

@implementation ContactDetailsViewController

// table's section indexes
#define LOCATION_SECTION 0
#define DEVICES_SECTION  1
#define NOTES_SECTION    2
#define REQUESTS_SECTION 3

// segue ID when "Add Contact" cell is tapped
static NSString *kAddDeviceSegueID = @"addDevice";

// segue ID when "Notes" cell is tapped
static NSString *kShowNotesSegueID = @"showNotes";

// segue ID when the contat (location) cell is tapped
static NSString *kShowLocationTypeSegueID = @"showLocationType";

// segue ID when the contat (location) cell is tapped
static NSString *kSubmitRequestTypeSegueID = @"submitRequestType";

#pragma mark - View Controller


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
	
    [self.photoButton setImage:self.contact.contactImage forState:UIControlStateNormal];
	self.navigationItem.title = self.contact.name;
    self.nameTextField.text = self.contact.name;
    self.titleTextField.text = self.contact.title;
    self.emailTextField.text = self.contact.email;
    self.contractDatePicker.date = self.contact.contractDate;
	[self updatePhotoButton];
    
	/*
	 Create a mutable array that contains the contact's devices ordered by displayOrder.
	 The table view uses this array to display the devices.
	 Core Data relationships are represented by sets, so have no inherent order. Order is "imposed" using the displayOrder attribute, but it would be inefficient to create and sort a new array each time the devices section had to be laid out or updated.
	 */
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"displayOrder" ascending:YES];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
	
	NSMutableArray *sortedDevices = [[NSMutableArray alloc] initWithArray:[self.contact.devices allObjects]];
	[sortedDevices sortUsingDescriptors:sortDescriptors];
	self.devices = sortedDevices;
    
	// update contact type and devices on return
    [self.tableView reloadData];
}
/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

#pragma mark - Editing

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    
    [super setEditing:editing animated:animated];
    
    if (!self.singleEdit)
    {
        [self updatePhotoButton];
        self.nameTextField.enabled = editing;
        self.titleTextField.enabled = editing;
        self.emailTextField.enabled = editing;
        self.contractDatePicker.enabled = editing;
        [self.navigationItem setHidesBackButton:editing animated:YES];
        
        [self.tableView beginUpdates];
        
        NSUInteger devicesCount = self.contact.devices.count;
        
        NSArray *devicesInsertIndexPath = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:devicesCount inSection:DEVICES_SECTION]];
        
        if (editing)
        {
            [self.tableView insertRowsAtIndexPaths:devicesInsertIndexPath withRowAnimation:UITableViewRowAnimationTop];
            self.titleTextField.placeholder = @"Title";
        }
        else
        {
            [self.tableView deleteRowsAtIndexPaths:devicesInsertIndexPath withRowAnimation:UITableViewRowAnimationTop];
            self.titleTextField.placeholder = @"";
        
            /*
            //format contract date
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"MMM d, YYYY"];
            self.contractDatePicker.date = self.contact.contractDate;
            */
        }
        
        [self.tableView endUpdates];
    }
    
	/*
	 If editing is finished, save the managed object context.
	 */
	if (!editing)
    {
		NSManagedObjectContext *context = self.contact.managedObjectContext;
		NSError *error = nil;
		if (![context save:&error])
        {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		}
	}
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	
	if (textField == self.nameTextField)
    {
		self.contact.name = self.nameTextField.text;
		self.navigationItem.title = self.contact.name;
	}
	else if (textField == self.titleTextField)
    {
		self.contact.title = self.titleTextField.text;
	}
    else if (textField == self.emailTextField)
    {
		self.contact.email = self.emailTextField.text;
	}
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
	[textField resignFirstResponder];
	return YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *title = nil;
    
    // return a title or nil as appropriate for the section
    switch (section)
    {
        case LOCATION_SECTION:
            title = @"Location";
            break;
        case DEVICES_SECTION:
            title = @"Devices";
            break;
        default:
            break;
    }
    
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSInteger rows = 0;
    
    /*
     The number of rows depends on the section.
     In the case of devices, if editing, add a row in editing mode to present an "Add Device" cell.
	 */
    switch (section)
    {
        case LOCATION_SECTION:
        case NOTES_SECTION:
            rows = 1;
            break;
        case DEVICES_SECTION:
            rows = self.contact.devices.count;
            if (self.editing)
            {
                rows++;
            }
            break;
            
        //need to add section for requests, but first have to add entity to data model******************
		default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    
    // For the Devices section, if necessary create a new cell and configure it with
    // an additional label for the amount.  Give the cell a different identifier from that
    // used for cells in other sections so that it can be dequeued separately.
    //
    if (indexPath.section == DEVICES_SECTION)
    {
		NSUInteger deviceCount = self.contact.devices.count;
        NSInteger row = indexPath.row;
		
        if (indexPath.row < (NSInteger)deviceCount)
        {
            // If the row is within the range of the number of devices for the current contact,
            // then configure the cell to show the device name and amount.
			//
			cell = [tableView dequeueReusableCellWithIdentifier:@"DevicesCell" forIndexPath:indexPath];
            
            Device *device = [self.devices objectAtIndex:row];
            cell.textLabel.text = device.number; //phone number of device
			cell.detailTextLabel.text = device.type; //type of mobile device
        }
        else
        {
            // If the row is outside the range, it's the row that was added to allow insertion
            // (see tableView:numberOfRowsInSection:) so give it an appropriate label.
            //
			cell = [tableView dequeueReusableCellWithIdentifier:@"AddDeviceCellIdentifier" forIndexPath:indexPath]; 
        }
    }
    else
    {
        switch (indexPath.section)
        {
            case LOCATION_SECTION:  // Location type cell
                cell = [tableView dequeueReusableCellWithIdentifier:@"ContactLocation" forIndexPath:indexPath];
                cell.textLabel.text = [self.contact.location valueForKey:@"name"];
                break;
                
            case NOTES_SECTION: // Notes cell
                cell = [tableView dequeueReusableCellWithIdentifier:@"Notes" forIndexPath:indexPath];
                break;
                
            default:
                break;
        }
    }
    
    //add else statement for the requests view
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // user has started a swipe to delete operation
    self.singleEdit = YES;
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // swipe to delete operation has ended
    self.singleEdit = NO;
}
//list devices by phone number
- (Device *)deviceByNumber:(NSString *)deviceNumber {
    
    Device *device = nil;
    NSArray *devices = [self.contact.devices allObjects];
    for (device in devices) {
        if ([device.number isEqualToString:deviceNumber])
            break;  // we found the right device by number
    }
    return device;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == LOCATION_SECTION && indexPath.row == 0) {
        // edit the location "type"- pass the contact
        //
        LocationSelectionViewController *locationSelectionViewController =
        [[LocationSelectionViewController alloc] initWithStyle:UITableViewStylePlain];
        locationSelectionViewController.contact = self.contact;
        
        // present modally the location type view controller
        UINavigationController *navController =
        [[UINavigationController alloc] initWithRootViewController:locationSelectionViewController];
        navController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:navController animated:YES completion:nil];
    }
    else if (indexPath.section == DEVICES_SECTION) {
        // edit the contact "device" - pass the device
        //
        DeviceDetailViewController *deviceDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DeviceDetailViewController"];
        deviceDetailViewController.contact = self.contact;
        
        // find the selected device table cell (based on indexPath),
        // use it's device phone number to find the right device object for this contact.
        // note: you can't use indexPath.row to lookup the contact's device object because NSSet is not ordered
        //
        UITableViewCell *deviceCell = [tableView cellForRowAtIndexPath:indexPath];
        deviceDetailViewController.device = [self deviceByNumber:deviceCell.textLabel.text];
        
        // present modally the device detail view controller
        UINavigationController *navController =
        [[UINavigationController alloc] initWithRootViewController:deviceDetailViewController];
        navController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:navController animated:YES completion:nil];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSIndexPath *rowToSelect = indexPath;
    NSInteger section = indexPath.section;
    BOOL isEditing = self.editing;
    
    // If editing, don't allow notes to be selected
    // Not editing: Only allow notes to be selected
    //
    if ((isEditing && section == NOTES_SECTION) || (!isEditing && section != NOTES_SECTION)) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        rowToSelect = nil;
    }
    
	return rowToSelect;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:kAddDeviceSegueID]) {
        // add a device
        //
        Contact *contact = nil;
        if ([sender isKindOfClass:[Contact class]]) {
            // the sender is the actual contact sent from "didAddContact" delegate (user created a new contact)
            // pass the contact
            contact = (Contact *)sender;
            
            UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
            DeviceDetailViewController *deviceDetailViewController = (DeviceDetailViewController *)navController.topViewController;
            deviceDetailViewController.contact = contact;
        }
    }
    else if ([segue.identifier isEqualToString:kShowNotesSegueID]) {
        // show and/or edit the notes - pass the contact
        //
        NotesViewController *notesViewController = (NotesViewController *)segue.destinationViewController;
        notesViewController.contact = self.contact;
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCellEditingStyle style = UITableViewCellEditingStyleNone;
    
    // Only allow editing in the devices section.
    // In the devices section, the last row (row number equal to the count of devices)
    // is added automatically (see tableView:cellForRowAtIndexPath:) to provide an insertion cell,
    // so configure that cell for insertion; the other cells are configured for deletion.
    //
    if (indexPath.section == DEVICES_SECTION) {
        // If this is the last item, it's the insertion row.
        if (indexPath.row == (NSInteger)self.contact.devices.count) {
            style = UITableViewCellEditingStyleInsert;
        }
        else {
            style = UITableViewCellEditingStyleDelete;
        }
    }
    
    return style;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Only allow deletion, and only in the devices section
    if ((editingStyle == UITableViewCellEditingStyleDelete) && (indexPath.section == DEVICES_SECTION)) {
        // Remove the corresponding device object from the contact's device list and delete the appropriate table view cell.
        Device *device = [self.devices objectAtIndex:indexPath.row];
        [self.contact removeDevicesObject:device];
        [self.devices removeObject:device];
        
        NSManagedObjectContext *context = device.managedObjectContext;
        [context deleteObject:device];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // user tapped the "+" button to add a new device
        
        [self performSegueWithIdentifier:kAddDeviceSegueID sender:self.contact];
    }
}

#pragma mark - Moving rows

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BOOL canMove = NO;
    // Moves are only allowed within the devices section.  Within the devices section, the last row (Add Device) cannot be moved.
    if (indexPath.section == DEVICES_SECTION) {
        canMove = indexPath.row != (NSInteger)self.contact.devices.count;
    }
    return canMove;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
    NSIndexPath *target = proposedDestinationIndexPath;
    
    // Moves are only allowed within the devices section, so make sure the destination
    // is in the devices section. If the destination is in the devices section,
    // make sure that it's not the Add Device row -- if it is, retarget for the penultimate row.
    //
	NSUInteger proposedSection = proposedDestinationIndexPath.section;
	
    if (proposedSection < DEVICES_SECTION) {
        target = [NSIndexPath indexPathForRow:0 inSection:DEVICES_SECTION];
    } else if (proposedSection > DEVICES_SECTION) {
        target = [NSIndexPath indexPathForRow:(self.contact.devices.count - 1) inSection:DEVICES_SECTION];
    } else {
        NSUInteger devicesCount_1 = self.contact.devices.count - 1;
        
        if (proposedDestinationIndexPath.row > (NSInteger)devicesCount_1) {
            target = [NSIndexPath indexPathForRow:devicesCount_1 inSection:DEVICES_SECTION];
        }
    }
	
    return target;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	
	/*
	 Update the devices array in response to the move.
	 Update the display order indexes within the range of the move.
	 */
    Device *device = [self.devices objectAtIndex:fromIndexPath.row];
    [self.devices removeObjectAtIndex:fromIndexPath.row];
    [self.devices insertObject:device atIndex:toIndexPath.row];
	
	NSInteger start = fromIndexPath.row;
	if (toIndexPath.row < start) {
		start = toIndexPath.row;
	}
	NSInteger end = toIndexPath.row;
	if (fromIndexPath.row > end) {
		end = fromIndexPath.row;
	}
	for (NSInteger i = start; i <= end; i++) {
		device = [self.devices objectAtIndex:i];
		device.displayOrder = [NSNumber numberWithInteger:i];
	}
}


#pragma mark - Photo

- (IBAction)photoTapped {
    
    // If in editing state, then display an image picker; if not, create and push a photo view controller.
	if (self.editing) {
		UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		[self presentViewController:imagePicker animated:YES completion:nil];
	} else {
		ContactPhotoViewController *contactPhotoViewController = [[ContactPhotoViewController alloc] init];
        contactPhotoViewController.hidesBottomBarWhenPushed = YES;
		contactPhotoViewController.contact = self.contact;
		[self.navigationController pushViewController:contactPhotoViewController animated:YES];
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)selectedImage editingInfo:(NSDictionary *)editingInfo {
	
	// Delete any existing image.
	NSManagedObject *oldImage = self.contact.image;
	if (oldImage != nil) {
		[self.contact.managedObjectContext deleteObject:oldImage];
	}
	
    // Create an image object for the new image.
	NSManagedObject *image =
    [NSEntityDescription insertNewObjectForEntityForName:@"Image"
                                  inManagedObjectContext:self.contact.managedObjectContext];
	self.contact.image = image;
    
	// Set the image for the image managed object.
	[image setValue:selectedImage forKey:@"image"];
	
	// Create a thumbnail version of the image for the contact object.
	CGSize size = selectedImage.size;
	CGFloat ratio = 3;
	if (size.width > size.height) {
		ratio = 60.0 / size.width;
	} else {
		ratio = 50.0 / size.height;
	}
	CGRect rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
	
	UIGraphicsBeginImageContext(rect.size);
	[selectedImage drawInRect:rect];
	self.contact.contactImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updatePhotoButton {
    
	/*
	 How to present the photo button depends on the editing state and whether the contact has a thumbnail image.
	 * If the contact has a thumbnail, set the button's highlighted state to the same as the editing state (it's highlighted if editing).
	 * If the contact doesn't have a thumbnail, then: if editing, enable the button and show an image that says "Choose Photo" or similar; if not editing then disable the button and show nothing.
	 */
	BOOL editing = self.editing;
	
	if (self.contact.contactImage != nil) {
		self.photoButton.highlighted = editing;
	} else {
		self.photoButton.enabled = editing;
		
		if (editing) {
			[self.photoButton setImage:[UIImage imageNamed:@"addPhoto.png"] forState:UIControlStateNormal];
		} else {
			[self.photoButton setImage:nil forState:UIControlStateNormal];
		}
	}
}


@end
