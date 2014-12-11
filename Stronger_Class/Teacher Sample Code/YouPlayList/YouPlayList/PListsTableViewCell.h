//
//  PListsTableViewCell.h
//  YouPlayList
//
//  Created by Stronger Shen on 2014/9/14.
//  Copyright (c) 2014年 MobileIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PListsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewP;
@property (weak, nonatomic) IBOutlet UILabel *textLabelP;
@property (weak, nonatomic) IBOutlet UILabel *publishedP;
@property (weak, nonatomic) IBOutlet UILabel *countHint;

@end
