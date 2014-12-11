//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;

@end

@implementation ViewController
- (IBAction)toClik:(id)sender {
    if(_myIndicator.isAnimating==YES){
        [_myIndicator stopAnimating];
    }else{
        [_myIndicator startAnimating];
    }
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
