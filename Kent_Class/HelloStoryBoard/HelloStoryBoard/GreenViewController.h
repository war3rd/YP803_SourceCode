//
//  GreenViewController.h
//  HelloStoryBoard
//
//  Created by User on 2014/9/26.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GreenViewController : UIViewController
- (IBAction)backByCode:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property(strong, nonatomic) NSDate *dateTime;
@end
