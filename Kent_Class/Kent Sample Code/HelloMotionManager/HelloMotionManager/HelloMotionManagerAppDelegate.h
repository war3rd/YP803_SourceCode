//
//  HelloMotionManagerAppDelegate.h
//  HelloMotionManager
//
//  Created by Liu Kent on 2011/3/24.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloMotionManagerViewController;

@interface HelloMotionManagerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloMotionManagerViewController *viewController;

@end
