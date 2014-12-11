//
//  HelloHTTPGetASyncViewController.m
//  HelloHTTPGetASync
//
//  Created by Liu Kent on 2011/4/5.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloHTTPGetASyncViewController.h"



@implementation HelloHTTPGetASyncViewController

- (void)dealloc
{
    [myImageView1 removeFromSuperview];
    [myImageView1 release];
    
    [myImageView2 removeFromSuperview];
    [myImageView2 release];    
    
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];


    if(myImageView1==nil)
    {
        myImageView1=[[MyUIImageView alloc] initWithFrame:CGRectMake(50, 0, 200, 200)];
        
        [self.view addSubview:myImageView1];
        
        [myImageView1 showImageWithURL:[NSURL URLWithString:@"http://0rz.tw/tjtKe"]];
        
        myImageView2=[[MyUIImageView alloc] initWithFrame:CGRectMake(50, 230, 200, 200)];
        
        [self.view addSubview:myImageView2];
        
        [myImageView2 showImageWithURL:[NSURL URLWithString:@"http://0rz.tw/hkfjy"]];        
    }

}


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

@end
