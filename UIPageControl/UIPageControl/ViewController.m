//
//  ViewController.m
//  UIPageControl
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIPageControl *myPageControl;

@end

@implementation ViewController
- (IBAction)swipActionconnect:(UISwipeGestureRecognizer *)sender{
    if(sender.direction==UISwipeGestureRecognizerDirectionLeft){
        _myPageControl.currentPage++;
        [UIView transitionWithView:_myImageView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{_myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"dog%d.jpg",_myPageControl.currentPage+1]];} completion:nil];
    }else{
        _myPageControl.currentPage--;
                [UIView transitionWithView:_myImageView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{_myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"dog%d.jpg",_myPageControl.currentPage+1]];} completion:nil];
    }
    
    
}
- (IBAction)pageChanged:(UIPageControl *)sender {
    NSLog(@"%ld",(long)sender.currentPage);
    _myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"dog%d.jpg",sender.currentPage+1]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
