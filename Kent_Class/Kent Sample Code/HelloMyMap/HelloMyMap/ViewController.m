//
//  ViewController.m
//  HelloMyMap
//
//  Created by Kent Liu on 12/11/11.
//  Copyright (c) 2012年 Kent Liu. All rights reserved.
//

#import "ViewController.h"
#import "HousePlaceMark.h"
#import "CSImageAnnotationView.h"

@interface ViewController ()
{
    BOOL bTheFirstLocationReceived;
}
@property (nonatomic,strong) CLLocationManager *locationManager;


@end

@implementation ViewController
//@synthesize locationManager=_locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if(_locationManager==nil)
    {
        self.locationManager=[[CLLocationManager alloc] init];
        _locationManager.delegate=self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
        _locationManager.activityType=CLActivityTypeAutomotiveNavigation;
        [_locationManager startUpdatingLocation];
        
        if([_locationManager respondsToSelector:@selector(	requestAlwaysAuthorization)])
        {
            [_locationManager requestAlwaysAuthorization];
        }
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark -
#pragma mark - CLLocationManagerDelegate Methods

// Until iOS6
/*
- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
  

    
}
*/
// iOS6 and later
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation=[locations lastObject];
    
    NSLog(@"New Location: %.6f,%.6f",newLocation.coordinate.latitude
          ,newLocation.coordinate.longitude);
    
    if(bTheFirstLocationReceived==NO)
    {
        MKCoordinateRegion region=[_theMapView region];
        region.center=newLocation.coordinate;
        region.span.latitudeDelta=0.1;
        region.span.longitudeDelta=0.1;
        [_theMapView setRegion:region animated:YES];
        
        // Add a Placemark
        CLLocationCoordinate2D placeMarkCoordinate=newLocation.coordinate;
        placeMarkCoordinate.latitude+=0.005;
        placeMarkCoordinate.longitude+=0.005;
        
        HousePlaceMark *placeMark=[[HousePlaceMark alloc] initWithCoordinate:placeMarkCoordinate
                                                                   withTitle:@"肯德基"
                                                                withSubTitle:@"真好吃！"];
        
        [_theMapView addAnnotation:placeMark];
        
        bTheFirstLocationReceived=YES;
    }
    
}

- (IBAction)mapTypeValueChanged:(id)sender {
    
    NSInteger selectedIndex=[sender selectedSegmentIndex];
    
    switch (selectedIndex) {
        case 0:
            [_theMapView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [_theMapView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [_theMapView setMapType:MKMapTypeHybrid];
            break;
        default:
            break;
    }

}

- (IBAction)trackingModeValueChanged:(id)sender {
    
    NSInteger selectedIndex=[sender selectedSegmentIndex];
    
    switch (selectedIndex) {
        case 0:
            _theMapView.userTrackingMode=MKUserTrackingModeNone;
            break;
        case 1:
            _theMapView.userTrackingMode=MKUserTrackingModeFollow;
            break;
        case 2:
            _theMapView.userTrackingMode=MKUserTrackingModeFollowWithHeading;
            break;
        default:
            break;
    }
    
}

- (MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if(annotation==mapView.userLocation)
        return nil;
    
//    MKPinAnnotationView *resultView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Store"];
   
    CSImageAnnotationView *resultView=(CSImageAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"store"];
    
    if(resultView==nil)
    {
        resultView=[[CSImageAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"store"];
    }
    
    resultView.annotation=annotation;
    
    resultView.canShowCallout=YES;
    
//    resultView.pinColor=MKPinAnnotationColorGreen;
    
    resultView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    UIImage *houseImage=[UIImage imageNamed:@"home.png"];
    resultView.leftCalloutAccessoryView=[[UIImageView alloc] initWithImage:houseImage];
    
//    resultView.animatesDrop=YES;
    
    return resultView;
}

- (void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Button Tapped!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [alertView show];
    // [alertView release];
}

@end











