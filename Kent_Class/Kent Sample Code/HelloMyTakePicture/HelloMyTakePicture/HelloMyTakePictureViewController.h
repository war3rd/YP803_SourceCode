//
//  HelloMyTakePictureViewController.h
//  HelloMyTakePicture
//
//  Created by Kent Liu on 2011/7/17.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloMyTakePictureViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    
    IBOutlet UIImageView *resultImageView;
    
    IBOutlet UISegmentedControl *sourceType;
    IBOutlet UISegmentedControl *cameraType;    
    
    IBOutlet UIView *myOverlayView;
    
    UIImagePickerController *currentImagePicker;
    
}
- (IBAction) goButtonPressed;

- (IBAction) takePictureButtonPressed;

@end
