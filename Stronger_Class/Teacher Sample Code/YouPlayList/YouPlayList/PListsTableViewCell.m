//
//  PListsTableViewCell.m
//  YouPlayList
//
//  Created by Stronger Shen on 2014/9/14.
//  Copyright (c) 2014年 MobileIT. All rights reserved.
//

#import "PListsTableViewCell.h"

@implementation PListsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
