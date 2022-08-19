//
//  MapFavoriteViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 19/08/22.
//

#import "MapFavoriteViewController.h"
#import <MapKit/MapKit.h>
#import "User.h"
#import "Poi.h"

@interface MapFavoriteViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom;

@end

@implementation MapFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    Poi *userPoi = [User sharedUser].city.position;
    self.favoriteList = [User sharedUser].favoriteList;
    [self centerMapToLocation:CLLocationCoordinate2DMake(userPoi.latitude, userPoi.longitude)
                         zoom:0.1];
    //self.mapView.showsUserLocation = YES;
}


- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
