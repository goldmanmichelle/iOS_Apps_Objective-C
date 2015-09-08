//
//  ContactTableViewCell.m
//  yesMAM
//
//  Created by Michelle Goldman on 6/18/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "ContactTableViewCell.h"

@interface ContactTableViewCell ()

@property (nonatomic, strong) UIImageView *contactImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contractDateLabel;

- (CGRect)_imageViewFrame;
- (CGRect)_nameLabelFrame;
- (CGRect)_positionLabelFrame; //change from titleLabelFrame to positionLabelFrame
- (CGRect)_contractDateLabelFrame;

@end

#pragma mark -

@implementation ContactTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
	if (self = [super initWithCoder:aDecoder])
    {
        //set image in tableview row
        _contactImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		self.contactImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.contactImageView];
        
        //set title label in tableview row
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.titleLabel setTextColor:[UIColor darkGrayColor]];
        [self.titleLabel setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.titleLabel];
        
        //set contract date label in tableview row
        _contractDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.contractDateLabel.textAlignment = NSTextAlignmentRight;
        [self.contractDateLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.contractDateLabel setTextColor:[UIColor blackColor]];
        [self.contractDateLabel setHighlightedTextColor:[UIColor whiteColor]];
		self.contractDateLabel.minimumScaleFactor = 7.0;
		self.contractDateLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.contractDateLabel];
        
        //set name label in tableview row
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.nameLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
        [self.nameLabel setTextColor:[UIColor blackColor]];
        [self.nameLabel setHighlightedTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:self.nameLabel];
    }
    
    return self;
}

// to save space, the contract date label disappears during editing
- (void)layoutSubviews {
    
    [super layoutSubviews];
	
    [self.contactImageView setFrame:[self _imageViewFrame]];
    [self.nameLabel setFrame:[self _nameLabelFrame]];
    [self.titleLabel setFrame:[self _positionLabelFrame]];
    [self.contractDateLabel setFrame:[self _contractDateLabelFrame]];
    if (self.editing) {
        self.contractDateLabel.alpha = 0.0;
    } else {
        self.contractDateLabel.alpha = 1.0;
    }
}

#define IMAGE_SIZE          42.0
#define EDITING_INSET       10.0
#define TEXT_LEFT_MARGIN    8.0
#define TEXT_RIGHT_MARGIN   5.0
#define CONTRACT_DATE_WIDTH 80.0

// returns the frame of the nameLabel subview, dependent on editing state of cell
- (CGRect)_imageViewFrame {
    
    if (self.editing) {
        return CGRectMake(EDITING_INSET, 0.0, IMAGE_SIZE, IMAGE_SIZE);
    }
	else {
        return CGRectMake(0.0, 0.0, IMAGE_SIZE, IMAGE_SIZE);
    }
}

- (CGRect)_nameLabelFrame {
    
    if (self.editing) {
        return CGRectMake(IMAGE_SIZE + EDITING_INSET + TEXT_LEFT_MARGIN, 4.0, self.contentView.bounds.size.width - IMAGE_SIZE - EDITING_INSET - TEXT_LEFT_MARGIN, 16.0);
    }
	else {
        return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN, 4.0, self.contentView.bounds.size.width - IMAGE_SIZE - TEXT_RIGHT_MARGIN * 2 - CONTRACT_DATE_WIDTH, 16.0);
    }
}


- (CGRect)_positionLabelFrame {
    
    if (self.editing) {
        return CGRectMake(IMAGE_SIZE + EDITING_INSET + TEXT_LEFT_MARGIN, 22.0, self.contentView.bounds.size.width - IMAGE_SIZE - EDITING_INSET - TEXT_LEFT_MARGIN, 16.0);
    }
	else {
        return CGRectMake(IMAGE_SIZE + TEXT_LEFT_MARGIN, 22.0, self.contentView.bounds.size.width - IMAGE_SIZE - TEXT_LEFT_MARGIN, 16.0);
    }
}

- (CGRect)_contractDateLabelFrame {
    
    CGRect contentViewBounds = self.contentView.bounds;
    return CGRectMake(contentViewBounds.size.width - CONTRACT_DATE_WIDTH - TEXT_RIGHT_MARGIN, 4.0, CONTRACT_DATE_WIDTH, 16.0);
}

#pragma mark - Contact set accessor

- (void)setContact:(Contact *)newContact
{
    
    if (newContact != _contact)
    {
        _contact = newContact;
	}
	self.contactImageView.image = _contact.contactImage;
	self.nameLabel.text = (_contact.name.length > 0) ? _contact.name : @"-";
	self.titleLabel.text = (_contact.title != nil) ? _contact.title : @"-";
    
    //format contract date
   // NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //[dateFormat setDateFormat:@"MMM d, YYYY"];
    //self.contractDateLabel.text = [dateFormat stringFromDate:[self.contact contractDate]];
	//self.contractDateLabel.text = (_contact.contractDate != nil) ? _contact.contractDate : @"-";
     
}



@end
