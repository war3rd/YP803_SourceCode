//
//  HelloHeadingViewController.m
//  HelloHeading
//
//  Created by Liu Kent on 2011/3/29.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloHeadingViewController.h"

@implementation HelloHeadingViewController

- (void)dealloc
{
    [labelHeading release];
    [imageViewHeading release];
    
    [locationManager release];
    
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
    
    if(locationManager==nil)
    {
        if([CLLocationManager headingAvailable]==YES)
        {
            locationManager=[[CLLocationManager alloc] init];
            locationManager.delegate=self;
            
            [locationManager startUpdatingHeading];
        }
        else
        {
            labelHeading.text=@"Device don't support Heading!";
        }
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

#define degreesToRadians(x) (M_PI * (x) / 180.0)

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading 
{
    labelHeading.text=[NSString stringWithFormat:@"TrueHeading: %03.0f MagneticHeading: %03.0f"
                       ,newHeading.trueHeading
                       ,newHeading.magneticHeading];
    
    imageViewHeading.transform = CGAffineTransformMakeRotation(degreesToRadians(newHeading.trueHeading*-1));

    
}

@end
