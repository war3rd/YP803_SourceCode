//
//  MainViewController.m
//  UITextField
//
//  Created by BigkongWang on 2014/9/1.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation MainViewController
- (IBAction)loginButton:(id)sender {
    
    if([_nameTextField.text isEqualToString:@"max@gmail.com"]&&[_passwordTextField.text isEqualToString:@"max"]){
        [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==_nameTextField){
        [_passwordTextField becomeFirstResponder];
    }else if(textField==_passwordTextField){
        [_passwordTextField resignFirstResponder];
    }
    return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"showAlternate"]){
        [[segue destinationViewController] setDelegate:self];
    }else if([[segue identifier] isEqualToString:@"LoginSegue"]){
        FlipsideViewController *controller=segue.destinationViewController;
        controller.name=_nameTextField.text;
        //[segue.destinationViewController setName:_nameTextField];
        
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

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
