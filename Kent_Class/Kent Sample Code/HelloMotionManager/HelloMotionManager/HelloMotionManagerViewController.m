//
//  HelloMotionManagerViewController.m
//  HelloMotionManager
//
//  Created by Liu Kent on 2011/3/24.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloMotionManagerViewController.h"

#define UPDATE_HZ 60

@interface HelloMotionManagerViewController (Private)

- (void) startMonitor;
- (void) stopMonitor;

@end

@implementation HelloMotionManagerViewController

- (void)dealloc
{
    [labelAccelerometerStatusX release];
    [labelAccelerometerStatusY release];    
    [labelAccelerometerStatusZ release];
    
    [self stopMonitor];
    
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
    
    [self startMonitor];
    

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

- (void) startMonitor {
    
    if(motionManager==nil)
    {
        motionManager=[[CMMotionManager alloc] init];
        
        if([motionManager isAccelerometerAvailable]==YES)
        {
            labelAccelerometerStatusX.text=@"So far,no Accelerometer Status.";
            
            motionManager.accelerometerUpdateInterval = (float)1/UPDATE_HZ;           
            [motionManager startAccelerometerUpdates];
            
            if(timerMonitor==nil)
            {
                timerMonitor = [NSTimer scheduledTimerWithTimeInterval: motionManager.accelerometerUpdateInterval
                                                                target: self
                                                              selector: @selector(handleTimer)
                                                              userInfo: nil
                                                               repeats: YES];	        
            }            
            
        }
        else
        {
            labelAccelerometerStatusX.text=@"Device don't support Accelerometer!";
            NSLog(@"Device don't support Accelerometer!");
        }
        
    }    
}

- (void) stopMonitor {
    // Stop the timer
    [timerMonitor invalidate];
    timerMonitor=nil;
    
    // Stop the Accelermeter
    [motionManager stopAccelerometerUpdates];
    [motionManager release],motionManager=nil;
}

#define kFilteringFactor 0.1

- (void) handleTimer {
    CMAccelerometerData *newestAccel = motionManager.accelerometerData;
    
    CMAcceleration acceleration=newestAccel.acceleration;
    
    // Hight Pass Filter

    accelX = acceleration.x - ( (acceleration.x * kFilteringFactor) + (accelX * (1.0 - kFilteringFactor)) );
    
    accelY = acceleration.y - ( (acceleration.y * kFilteringFactor) + (accelY * (1.0 - kFilteringFactor)) );
    
    accelZ = acceleration.z - ( (acceleration.z * kFilteringFactor) + (accelZ * (1.0 - kFilteringFactor)) );   


    // Low Pass Filter
/*
    accelX = (acceleration.x * kFilteringFactor) + (accelX * (1.0 - kFilteringFactor));
    
    accelY = (acceleration.y * kFilteringFactor) + (accelY * (1.0 - kFilteringFactor));
    
    accelZ = (acceleration.z * kFilteringFactor) + (accelZ * (1.0 - kFilteringFactor));    
 */ 
    
    NSString *stringResultX=[NSString stringWithFormat:@"X: %.1f",accelX];
    NSString *stringResultY=[NSString stringWithFormat:@"Y: %.1f",accelY];
    NSString *stringResultZ=[NSString stringWithFormat:@"Z: %.1f",accelZ];    
    
    labelAccelerometerStatusX.text=stringResultX;
    labelAccelerometerStatusY.text=stringResultY; 
    labelAccelerometerStatusZ.text=stringResultZ;    
    
    NSLog(@"%@,%@,%@",stringResultX,stringResultY,stringResultZ);
}



@end
