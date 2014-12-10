//
//  ViewController.m
//  AlertViewLogin
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)toShow:(id)sender {
   // UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"AlertView!!" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Login", nil];
//    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Upload Finish" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Login",nil];
//    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
//    [alertView show];

    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"upload" message:@"MyMessage" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Login", nil];
    [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alertView show];
    
    
    
}
-(IBAction)backToMain:(UIStoryboardSegue *)sender{
    NSLog(@"back to main Page!");
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        if([[alertView textFieldAtIndex:1].text isEqualToString:@"1234"]){
            [self performSegueWithIdentifier:@"loginSuccess" sender:nil];
        }
    }else{
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"login Failur" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
        
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