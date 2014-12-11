//
//  DetailViewController.h
//  HelloDropbox2
//
//  Created by Kent Liu on 2014/5/15.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <DropboxSDK/DropboxSDK.h>

@interface DetailViewController : UIViewController <DBRestClientDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end



