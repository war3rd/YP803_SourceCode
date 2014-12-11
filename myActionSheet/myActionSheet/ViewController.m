//
//  ViewController.m
//  myActionSheet
//
//  Created by BigkongWang on 2014/8/27.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonToClick:(id)sender {
    UIActionSheet *myActionSheet=[[UIActionSheet alloc]initWithTitle:@"myActionSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Load" otherButtonTitles:@"Save",@"Delete", nil];
        [myActionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"You press %d",buttonIndex);
}
@end
