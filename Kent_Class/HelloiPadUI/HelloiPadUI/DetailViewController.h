//
//  DetailViewController.h
//  HelloiPadUI
//
//  Created by Liu Kent on 2011/3/16.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {

    IBOutlet UIView *viewForPopover;
}


@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;

@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

-(IBAction) showPopoverOfButton1:(id)sender;
-(IBAction) showPopoverOfButton2:(id)sender;

@end
