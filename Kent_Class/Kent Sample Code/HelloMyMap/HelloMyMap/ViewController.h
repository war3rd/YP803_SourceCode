//
//  ViewController.h
//  HelloMyMap
//
//  Created by Kent Liu on 12/11/11.
//  Copyright (c) 2012年 Kent Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *theMapView;
- (IBAction)mapTypeValueChanged:(id)sender;
- (IBAction)trackingModeValueChanged:(id)sender;

@end
