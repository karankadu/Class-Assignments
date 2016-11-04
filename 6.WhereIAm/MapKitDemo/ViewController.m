//
//  ViewController.m
//  MapKitDemo
//
//  Created by Karan on 12/09/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize objMapView;
@synthesize btnHybrid, btnSatellite, btnStandard;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUserLocation];
}

- (IBAction)btnStandardTapped:(id)sender
{
    [btnStandard setBackgroundColor:[UIColor greenColor]];
    [btnSatellite setBackgroundColor:[UIColor clearColor]];
    [btnHybrid setBackgroundColor:[UIColor clearColor]];
    [objMapView setMapType:MKMapTypeStandard];
    [self loadUserLocation];
}

- (IBAction)btnSatelliteTapped:(id)sender
{
    [btnStandard setBackgroundColor:[UIColor clearColor]];
    [btnSatellite setBackgroundColor:[UIColor greenColor]];
    [btnHybrid setBackgroundColor:[UIColor clearColor]];
    [objMapView setMapType:MKMapTypeSatellite];
    [self loadUserLocation];
}

- (IBAction)btnHybridTapped:(id)sender
{
    [btnStandard setBackgroundColor:[UIColor clearColor]];
    [btnSatellite setBackgroundColor:[UIColor clearColor]];
    [btnHybrid setBackgroundColor:[UIColor greenColor]];
    [objMapView setMapType:MKMapTypeHybrid];
    [self loadUserLocation];
}

- (void) loadUserLocation
{
    objLocationManager = [[CLLocationManager alloc] init];
    objLocationManager.delegate = self;
    objLocationManager.distanceFilter = kCLDistanceFilterNone;
    objLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    if ([objLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [objLocationManager requestWhenInUseAuthorization];
    }
    [objLocationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0)
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [objLocationManager stopUpdatingLocation];
    [self loadMapView];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [objLocationManager stopUpdatingLocation];
}

- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude =  latitude_UserLocation, .longitude =  longitude_UserLocation};
    MKCoordinateSpan objCoorSpan = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [objMapView setRegion:objMapRegion];
}

@end
