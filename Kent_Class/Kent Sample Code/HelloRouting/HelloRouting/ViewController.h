//
//  ViewController.h
//  HelloRouting
//
//  Created by Kent Liu on 12/10/10.
//  Copyright (c) 2012年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *targetAddressTextField;
- (IBAction)goButtonPressed:(id)sender;

@end
