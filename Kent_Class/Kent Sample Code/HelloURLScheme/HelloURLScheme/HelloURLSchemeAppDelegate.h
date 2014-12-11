//
//  HelloURLSchemeAppDelegate.h
//  HelloURLScheme
//
//  Created by Liu Kent on 2011/3/30.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloURLSchemeViewController;

@interface HelloURLSchemeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloURLSchemeViewController *viewController;

@end
