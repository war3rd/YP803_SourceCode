//
//  RNMainViewController.m
//  HelloTextField
//
//  Created by Ryan on 2014/9/1.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import "RNMainViewController.h"

@interface RNMainViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation RNMainViewController
- (IBAction)loginButton:(id)sender {
    
    if ([_nameTextField.text isEqualToString:@"ryan@iii.org.tw"]&&
        [_passwordTextField.text isEqualToString:@"ryan"]) {
        
        [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==_nameTextField) {
        [_passwordTextField becomeFirstResponder];
    }else if (textField==_passwordTextField){
        [_passwordTextField resignFirstResponder];
    }
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _nameTextField.delegate=self;
    _passwordTextField.delegate=self;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(RNFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }else if ([[segue identifier] isEqualToString:@"LoginSegue"])
    {
        RNFlipsideViewController *controller=segue.destinationViewController;
        
        controller.name=_nameTextField.text;
        
    }
}

@end
