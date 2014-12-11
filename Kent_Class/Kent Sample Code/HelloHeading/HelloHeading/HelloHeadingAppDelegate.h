//
//  HelloHeadingAppDelegate.h
//  HelloHeading
//
//  Created by Liu Kent on 2011/3/29.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloHeadingViewController;

@interface HelloHeadingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloHeadingViewController *viewController;

@end
