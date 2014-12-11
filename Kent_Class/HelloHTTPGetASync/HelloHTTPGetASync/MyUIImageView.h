//
//  MyUIImageView.h
//  HelloHTTPGetASync
//
//  Created by Liu Kent on 2011/4/5.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyUIImageView : UIView {
    UIImageView *imageView;
    UIActivityIndicatorView *activityView;
    NSMutableData *respondData;
}

- (void) showImageWithURL:(NSURL*) urlImageFile;

@end
