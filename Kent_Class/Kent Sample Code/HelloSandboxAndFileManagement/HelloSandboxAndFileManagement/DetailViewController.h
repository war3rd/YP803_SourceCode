//
//  DetailViewController.h
//  HelloSandboxAndFileManagement
//
//  Created by Kent Liu on 2014/5/12.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
