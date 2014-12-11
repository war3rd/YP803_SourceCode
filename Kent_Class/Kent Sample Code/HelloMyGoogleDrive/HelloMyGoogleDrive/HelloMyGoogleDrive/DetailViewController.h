//
//  DetailViewController.h
//  HelloMyGoogleDrive
//
//  Created by Kent Liu on 2014/5/16.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTLDrive.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) GTLServiceDrive *driveService;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
