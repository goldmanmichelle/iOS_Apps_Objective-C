//
//  CustomTableCell.m
//  SFFlowers
//
//  Created by Michelle Goldman on 3/4/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell
@synthesize flowerLabel;
@synthesize nativeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
