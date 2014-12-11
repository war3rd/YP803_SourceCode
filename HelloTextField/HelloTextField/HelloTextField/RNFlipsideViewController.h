//
//  RNFlipsideViewController.h
//  HelloTextField
//
//  Created by Ryan on 2014/9/1.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RNFlipsideViewController;

@protocol RNFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(RNFlipsideViewController *)controller;
@end

@interface RNFlipsideViewController : UIViewController
@property NSString *name;
@property (weak, nonatomic) id <RNFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
