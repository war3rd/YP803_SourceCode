//
//  ViewController.m
//  UISwitch
//
//  Created by BigkongWang on 2014/9/1.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@end

@implementation ViewController
- (IBAction)toClick:(id)sender {
   _mySwitch.on==YES?
    [_mySwitch setOn:NO animated:YES]:
    [_mySwitch setOn:YES animated:YES];
    /*
    if(_mySwitch.on==YES){
        [_mySwitch setOn:NO animated:YES];
    }else{
        [_mySwitch setOn:YES animated:YES];
    }
     */
    
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
    sender.on==YES?
    NSLog(@"Switch to on"):
    NSLog(@"Switch to off");
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
