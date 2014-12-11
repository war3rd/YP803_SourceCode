//
//  ViewController.m
//  ViewTransititon
//
//  Created by BigkongWang on 2014/9/23.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL bShowView;
}
@property (weak, nonatomic) IBOutlet UIView *lightGreen;

@end

@implementation ViewController
-(IBAction)doneOK:(UIStoryboardSegue *)sender
{
    
}
- (IBAction)bbiHideShowAction:(id)sender {
    CGSize size= [UIScreen mainScreen].bounds.size;
    CGSize lightGreenSize=_lightGreen.frame.size;
    [UIView transitionWithView:_lightGreen duration:1 options:UIViewAnimationOptionTransitionNone animations:^{
        CGRect newFrame;
        if (bShowView) {
            newFrame=CGRectMake(0, size.height-44, 320, 154);
            _lightGreen.frame=newFrame;
        }else{
            newFrame=CGRectMake(0, size.height-156, lightGreenSize.width ,lightGreenSize.height);
            _lightGreen.frame=newFrame;
        }
        
        
    } completion:^(BOOL finished) {
        //
    }];
    bShowView=!bShowView;
}
- (IBAction)btnAction:(id)sender {
    self.view.alpha = 0;
    [UIView transitionWithView:self.view duration:1.0f options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.view.alpha=1;
    } completion:^(BOOL finished) {
        //
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    bShowView=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
