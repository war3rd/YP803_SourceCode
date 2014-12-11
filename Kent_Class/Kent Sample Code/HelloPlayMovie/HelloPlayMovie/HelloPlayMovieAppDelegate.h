//
//  HelloPlayMovieAppDelegate.h
//  HelloPlayMovie
//
//  Created by Liu Kent on 2011/3/23.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloPlayMovieViewController;

@interface HelloPlayMovieAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloPlayMovieViewController *viewController;

@end
