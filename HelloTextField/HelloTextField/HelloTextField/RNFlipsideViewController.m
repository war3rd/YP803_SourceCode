//
//  RNFlipsideViewController.m
//  HelloTextField
//
//  Created by Ryan on 2014/9/1.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import "RNFlipsideViewController.h"

@interface RNFlipsideViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@end

@implementation RNFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _showNameLabel.text=_name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.delegate flipsideViewControllerDidFinish:self];
}

@end
