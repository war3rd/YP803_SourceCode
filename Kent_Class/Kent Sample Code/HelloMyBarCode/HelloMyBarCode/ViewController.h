//
//  ViewController.h
//  HelloMyBarCode
//
//  Created by Kent Liu on 13/12/29.
//  Copyright (c) 2013年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController <ZBarReaderDelegate>
- (IBAction)scanButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;

@end



