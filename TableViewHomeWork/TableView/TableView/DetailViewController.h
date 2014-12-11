//
//  DetailViewController.h
//  TableView
//
//  Created by BigkongWang on 2014/9/24.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property NSString * fruitImageName;
@property NSString * fruitName;
@property (strong, nonatomic) id detailItem;
@property UIImage *fruitImage;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
