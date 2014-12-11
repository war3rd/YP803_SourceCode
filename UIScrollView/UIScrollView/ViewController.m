//
//  ViewController.m
//  UIScrollView
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation ViewController
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    [self.view bringSubviewToFront:scaleRatioLabel];
    [scaleRatioLabel setAlpha:0.6f];
    [scaleRatioLabel setBackgroundColor:[UIColor lightGrayColor]];
    scaleRatioLabel.text=[NSString stringWithFormat:@"X%.1f",scale];
    [UIView transitionWithView:scaleRatioLabel duration:2.0f options:UIViewAnimationOptionCurveEaseOut animations:^(void){scaleRatioLabel.alpha=0.0f; } completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myScrollView.delegate=self;
    UIImage *myImage=[UIImage imageNamed:@"2013-06-13 20.02.00.jpg"];
    imageView=[[UIImageView alloc]initWithImage:myImage];
    [imageView setFrame:CGRectMake(0,0, 2268, 568)];
    [_myScrollView addSubview:imageView];
    _myScrollView.contentSize=myImage.size;
    _myScrollView.minimumZoomScale=1.0f;
    _myScrollView.maximumZoomScale=5.0f;
    _myScrollView.zoomScale=1.0f;
    scaleRatioLabel=[[UILabel alloc]initWithFrame:CGRectMake(160-25, 284-12.5, 50, 25)];
    [scaleRatioLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:scaleRatioLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
