//
//  ViewController.m
//  ClickToShow
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
    count=0;  //Lab2
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonToClick:(id)sender {
    count++;  //Lab2
    _labelArea.text=[NSString stringWithFormat: @"%d", count];  //Lab2
       // _labelArea.text=@"hello"; //Lab1
    
;
}

@end
