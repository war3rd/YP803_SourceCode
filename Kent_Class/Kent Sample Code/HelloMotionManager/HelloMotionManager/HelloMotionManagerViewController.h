//
//  HelloMotionManagerViewController.h
//  HelloMotionManager
//
//  Created by Liu Kent on 2011/3/24.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface HelloMotionManagerViewController : UIViewController <UIAccelerometerDelegate>{
    CMMotionManager *motionManager;
    
    NSTimer *timerMonitor;
    
    IBOutlet UILabel *labelAccelerometerStatusX;
    IBOutlet UILabel *labelAccelerometerStatusY;
    IBOutlet UILabel *labelAccelerometerStatusZ;    
    
    double accelX;
    double accelY;
    double accelZ;
}

@end
