//
//  FlipsideViewController.h
//  UITextField
//
//  Created by BigkongWang on 2014/9/1.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end

@interface FlipsideViewController : UIViewController
@property (strong, nonatomic)NSString *name;
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@end
