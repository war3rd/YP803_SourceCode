//
//  ViewController.m
//  UIImageView
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*  Ryu gif*/
    NSMutableArray *anims=[NSMutableArray new];
    UIImage *img1=[UIImage imageNamed:@"Ryu.gif"];
    CGImageRef imageRef=CGImageCreateWithImageInRect(img1.CGImage, CGRectMake(0, 0, 90, 110));
    CGImageRef imageRef2=CGImageCreateWithImageInRect(img1.CGImage, CGRectMake(160, 0, 75, 110));
    [anims addObject:[UIImage imageWithCGImage:imageRef]];
    [anims addObject:[UIImage imageWithCGImage:imageRef2]];
    UIImageView   *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 200, 350)];
    
    imageView.animationImages=anims;
    imageView.animationDuration=1.0f;
    imageView.animationRepeatCount=0;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    
    
    
    /*smile */
    NSMutableArray *anims2=[NSMutableArray new];
    UIImage *img2=[UIImage imageNamed:@"Smile.gif"];
    UIImage *img3=[UIImage imageNamed:@"smile2.jpg"];
    /* ignore code
    CGImageRef imageRef3=CGImageCreateWithImageInRect(img2.CGImage, CGRectMake(0, 0, 200, 200));
    CGImageRef imageRef4=CGImageCreateWithImageInRect(img3.CGImage, CGRectMake(0, 0, 160, 160));
    [anims2 addObject:[UIImage imageWithCGImage:imageRef3]];
    [anims2 addObject:[UIImage imageWithCGImage:imageRef4]];
    */
    [anims2 addObject:img2];
    [anims2 addObject:img3];

     UIImageView   *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(150, 400, 50, 50)];
    
    imageView2.animationImages=anims2;
    imageView2.animationDuration=1.0f;
    imageView2.animationRepeatCount=0;
    [imageView2 startAnimating];
    [self.view addSubview:imageView2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
