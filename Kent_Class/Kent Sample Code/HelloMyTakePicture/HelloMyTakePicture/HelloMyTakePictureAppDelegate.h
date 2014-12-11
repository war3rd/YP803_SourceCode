//
//  HelloMyTakePictureAppDelegate.h
//  HelloMyTakePicture
//
//  Created by Kent Liu on 2011/7/17.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloMyTakePictureViewController;

@interface HelloMyTakePictureAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloMyTakePictureViewController *viewController;

@end
