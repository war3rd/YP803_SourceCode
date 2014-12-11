//
//  ViewController.m
//  ScrollViewANDPageControl
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *myPageControl;

@end

@implementation ViewController
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;   {
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for(NSInteger i=0;i<[[scrollView subviews] count];i++){
        if([scrollView convertPoint:[[scrollView.subviews objectAtIndex:i] frame].origin toView:self.view].x==0.0f){
            _myPageControl.currentPage=i;
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myScrollView.delegate=self;
    NSArray *imageArray=[NSArray arrayWithObjects:@"movie (1).jpg",@"movie (2).jpg",@"movie (3).jpg", nil];
    CGFloat scrollWidth=0.0f;
    for(NSString *thisImageName in imageArray){
        UIImageView *thisImageView=[[UIImageView alloc]initWithFrame:CGRectMake(scrollWidth, 0, 320.0f, 120.0f)];
        thisImageView.image=[UIImage imageNamed:thisImageName];
        [_myScrollView addSubview:thisImageView];
        scrollWidth+=320.0f;
    }
    _myScrollView.contentSize=CGSizeMake(scrollWidth, _myScrollView.frame.size.height);
    _myScrollView.zoomScale=1.0f;
    _myScrollView.pagingEnabled=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
