//
//  HelloHeadingViewController.h
//  HelloHeading
//
//  Created by Liu Kent on 2011/3/29.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HelloHeadingViewController : UIViewController <CLLocationManagerDelegate> {
    
    IBOutlet UILabel *labelHeading;
    
    IBOutlet UIImageView *imageViewHeading;
    
    CLLocationManager *locationManager;
    
}

@end
