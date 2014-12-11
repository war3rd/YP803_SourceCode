//
//  HelloMyTakePictureViewController.m
//  HelloMyTakePicture
//
//  Created by Kent Liu on 2011/7/17.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloMyTakePictureViewController.h"

@interface HelloMyTakePictureViewController ()

- (UIImage*) mergeImageWithBackgroundImage:(UIImage*)backgroundImage withFrameImage:(UIImage*)frameImage;

@end

@implementation HelloMyTakePictureViewController

- (void)dealloc
{
    [resultImageView release];
    [sourceType release];
    [cameraType release];
    [myOverlayView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) goButtonPressed {
    
    UIImagePickerController *ipc=[[UIImagePickerController alloc] init];
    
    // Setup parameters
    // Decide Source Type
    if(sourceType.selectedSegmentIndex==1 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]==NO)
    {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"" message:@"Source Type is not supported." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        [alertView release];
        
        [ipc release];
        return;
    }    
    
    ipc.sourceType=(sourceType.selectedSegmentIndex==0?
                    UIImagePickerControllerSourceTypePhotoLibrary:
                    UIImagePickerControllerSourceTypeCamera);
    
    // Decide Camera Type
    if(ipc.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        UIImagePickerControllerCameraDevice targetDevice;
        
        targetDevice=(cameraType.selectedSegmentIndex==0?UIImagePickerControllerCameraDeviceRear:UIImagePickerControllerCameraDeviceFront);
        
        if([UIImagePickerController isCameraDeviceAvailable:targetDevice]==NO)
        {
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"" message:@"Camera Type is not supported." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alertView show];
            [alertView release];
            
            [ipc release];
            return;            
        }
        ipc.cameraDevice=targetDevice;
    }
    
    ipc.mediaTypes=[NSArray arrayWithObjects:@"public.image", nil];
    ipc.allowsEditing=YES;
    
    if(ipc.sourceType==UIImagePickerControllerSourceTypeCamera)
    {    
        ipc.showsCameraControls=NO;
        [ipc.cameraOverlayView addSubview:myOverlayView];
    }
    ipc.delegate=self;
    
    currentImagePicker=ipc;
    
    [self presentModalViewController:ipc animated:YES];

    
    [ipc release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"info: %@",[info description]);
    
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    
    if([mediaType isEqualToString:@"public.image"])
    {
        // Use Image Here.
        
        UIImage *resultImage=[self mergeImageWithBackgroundImage:[info objectForKey:UIImagePickerControllerOriginalImage] withFrameImage:[UIImage imageNamed:@"frame_01.png"]];
        
        [resultImageView setImage:resultImage];
        
        UIImageWriteToSavedPhotosAlbum(resultImage, self,  
                                       @selector(image:didFinishSavingWithError:contextInfo:),
                                       nil);
        
    }
    else if([mediaType isEqualToString:@"public.movie"])
    {
        // Use Movie Here.
        NSString *tempFilePath=[[info objectForKey:UIImagePickerControllerMediaURL] path];
        
        if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(tempFilePath)==YES)
        {
            UISaveVideoAtPathToSavedPhotosAlbum(tempFilePath, self, @selector(videoFilePath:didFinishSavingWithError:contextInfo:), nil);
        }
        
    }
    
    [picker dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissModalViewControllerAnimated:YES];    
}

- (void) image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary*)info {
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"" message:@"Save Image OK." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
    [alertView release];
}

- (void) videoFilePath:(NSString*)videoFilePath didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary*)info {
 
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Save Video OK." message:videoFilePath delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
    [alertView release];    
    
    [[NSFileManager defaultManager] removeItemAtPath:videoFilePath error:nil];
    
}

- (IBAction) takePictureButtonPressed {
    
    [currentImagePicker takePicture];
    
}

- (UIImage*) mergeImageWithBackgroundImage:(UIImage*)backgroundImage withFrameImage:(UIImage*)frameImage {
    
    UIImage *resultImage=nil;
    
    CGSize sizeWholeContent=CGSizeMake(640, 960);
    
    UIGraphicsBeginImageContext(sizeWholeContent);
    
    [backgroundImage drawInRect:CGRectMake(0, 0, 640, 960)];
    
    [frameImage drawInRect:CGRectMake(0, 0, 640, 960)];
    
    UIColor *textColor=[UIColor redColor];
    [textColor set];
    
    NSString *stringText=@"Good Afternoon午安!";
    
    NSArray *fontFamilyArray=[UIFont familyNames];
    NSArray *fontNameOfFamily=[UIFont fontNamesForFamilyName:[fontFamilyArray objectAtIndex:6]];
    
    UIFont *textFont=[UIFont fontWithName:[fontNameOfFamily objectAtIndex:0] size:100];
    // iOS7
    if([stringText respondsToSelector:@selector(drawAtPoint:withAttributes:)])
    {
        NSDictionary *attributes=
        @{NSFontAttributeName: textFont,
          NSForegroundColorAttributeName:textColor};
        [stringText drawAtPoint:CGPointMake(0, 0)
           withAttributes:attributes];
    }
    else    // iOS6 and before
    {
        [stringText drawAtPoint:CGPointMake(0, 0) withFont:textFont];
    }

    resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}

@end
