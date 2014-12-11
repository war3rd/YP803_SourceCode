//
//  HelloProximityMonitorViewController.m
//  HelloProximityMonitor
//
//  Created by Liu Kent on 2011/3/18.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloProximityMonitorViewController.h"

@implementation HelloProximityMonitorViewController

- (void)dealloc
{
    [labelSupportStatus release];
    
	[[UIDevice currentDevice] setProximityMonitoringEnabled:NO];    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIDeviceProximityStateDidChangeNotification 
                                                  object:nil];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIDevice *device=[UIDevice currentDevice];
    
	[device setProximityMonitoringEnabled:YES];
    
    // If proximityMonitoringEnabled is still be NO,it is mean this device don't support ProximityMonitor
    if(device.proximityMonitoringEnabled==YES)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(proximityMonitorStateChanged) 
                                                     name:UIDeviceProximityStateDidChangeNotification 
                                                   object:nil];	
    }
    else
    {
        labelSupportStatus.text=@"Device is not supported by ProximityMonitor";
        NSLog(@"Device is not supported by ProximityMonitor");    
    }
 

}

-(void) proximityMonitorStateChanged
{
   if([[UIDevice currentDevice] proximityState]==YES)
   {
       labelSupportStatus.text=@"Device is close to user!";
       NSLog(@"Device is close to user!");
   }
   else
   {
       labelSupportStatus.text=@"Device is NOT close to user!";
       NSLog(@"Device is NOT close to user!");       
   }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
