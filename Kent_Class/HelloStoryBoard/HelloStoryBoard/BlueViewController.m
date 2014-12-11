//
//  BlueViewController.m
//  HelloStoryBoard
//
//  Created by User on 2014/9/26.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"right1" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed:)];
    // Do any additional setup after loading the view.
    UIBarButtonItem *rightButton2=[[UIBarButtonItem alloc]initWithTitle:@"right2" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed:)];
    self.navigationItem.rightBarButtonItems=@[rightButton,rightButton2];
    UIActivityIndicatorView *indicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicatorView.color=[UIColor redColor];
    [indicatorView startAnimating];
    self.navigationItem.titleView=indicatorView;
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    UIBarButtonItem *tool1Item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(toolBarButtonPressed:)];
    
    UIBarButtonItem *tool2Item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(toolBarButtonPressed:)];
    UIBarButtonItem *flexiableSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:@[tool1Item,flexiableSpace,tool2Item]animated:YES];

}

-(void) rightButtonPressed:(id)sender{
    [sender setTitle:@"HiHi"];
}
-(void)toolBarButtonPressed:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
