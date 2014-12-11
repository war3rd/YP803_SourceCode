//
//  ViewController.m
//  HelloSocialFramework
//
//  Created by Kent Liu on 12/10/10.
//  Copyright (c) 2012年 Kent Liu. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

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

- (IBAction)launchButtonPressed:(id)sender {
    
    NSArray *activityItems=@[@"Test Share",[UIImage imageNamed:@"Jobs.png"],[NSURL URLWithString:@"http://www.apple.com"]];
    
    UIActivityViewController *viewController=[[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];

    viewController.excludedActivityTypes=@[UIActivityTypePostToWeibo];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

- (IBAction)shareWithFacebookButtonPressed:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* viewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [viewController setInitialText:@"Share with FB"];
        [viewController addImage:[UIImage imageNamed:@"Jobs.png"]];
        [viewController addURL:[NSURL URLWithString:@"http://www.apple.com"]];
        
        [self presentViewController:viewController animated:YES completion:nil];
    }
    
    
}
@end
