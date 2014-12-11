//
//  HelloProximityMonitorAppDelegate.h
//  HelloProximityMonitor
//
//  Created by Liu Kent on 2011/3/18.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloProximityMonitorViewController;

@interface HelloProximityMonitorAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloProximityMonitorViewController *viewController;

@end
