//
//  ViewController.m
//  HelloRouting
//
//  Created by Kent Liu on 12/10/10.
//  Copyright (c) 2012年 Kent Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) launchMapsWithPlacemark:(CLPlacemark*)targetPlacemark;

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

- (IBAction)goButtonPressed:(id)sender {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    NSString *addressString = _targetAddressTextField.text; // Address Here
    
    [geocoder geocodeAddressString:addressString
                 completionHandler:^(NSArray *placemarks, NSError *error) {
                     
                     if (error) {
                         NSLog(@"Geocode failed with error: %@", error);
                         return;
                     }
                     
                     if (placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         
                         [self launchMapsWithPlacemark:placemark];
                     }
                 }];
    
}

- (void) launchMapsWithPlacemark:(CLPlacemark*)targetPlacemark {
    
    // Decide Source MapItem
    CLLocationCoordinate2D sourceCoordinate = CLLocationCoordinate2DMake(24.686525, 121.815312);
    MKPlacemark *sourcePlace = [[MKPlacemark alloc] initWithCoordinate:sourceCoordinate
                                                     addressDictionary:nil];
    
    MKMapItem *sourceMapItem = [[MKMapItem alloc]initWithPlacemark:sourcePlace];
    
    // Decide Target MapItem
    MKPlacemark *targetPlace = [[MKPlacemark alloc]
                          initWithPlacemark:targetPlacemark];
    
    MKMapItem *targetMapItem = [[MKMapItem alloc]initWithPlacemark:targetPlace];
    

    // Directions Options
    NSDictionary *options = @{
        MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
    };
    
    [MKMapItem openMapsWithItems:@[sourceMapItem,targetMapItem]
                   launchOptions:options];
}


@end
