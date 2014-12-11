//
//  HelloMapNavigationAppDelegate.h
//  HelloMapNavigation
//
//  Created by Liu Kent on 2011/3/6.
//  Copyright 2011 SoftArt Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloMapNavigationViewController;

@interface HelloMapNavigationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloMapNavigationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloMapNavigationViewController *viewController;

@end

