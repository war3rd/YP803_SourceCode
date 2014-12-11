//
//  FlipsideViewController.m
//  UITextField
//
//  Created by BigkongWang on 2014/9/1.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@end

@implementation FlipsideViewController

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
