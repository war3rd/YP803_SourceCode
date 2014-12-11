//
//  CustomizedTableViewCell.h
//  HelloStoryBoard
//
//  Created by richman on 2014/10/6.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomizedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *theImageView;
@property (weak, nonatomic) IBOutlet UILabel *theLabel;
- (IBAction)theSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;

@end
