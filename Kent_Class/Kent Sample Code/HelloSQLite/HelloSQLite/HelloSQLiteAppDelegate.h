//
//  HelloSQLiteAppDelegate.h
//  HelloSQLite
//
//  Created by Liu Kent on 2011/3/17.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloSQLiteViewController;

@interface HelloSQLiteAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloSQLiteViewController *viewController;

@end
