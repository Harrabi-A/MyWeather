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
#import "City.h"
#import "WeatherViewController.h"

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
                         zoom:25];
    
    
    //self.mapView.showsUserLocation = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    for (int i=0; i<[self.favoriteList size]; i++) {
        City *c = [self.favoriteList getAtIndex:i];
        [self.mapView addAnnotation:c];
    }
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *AnnotationIdentifer = @"MapAnnotationView";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifer];
    if(!view){
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                               reuseIdentifier:AnnotationIdentifer];
        view.canShowCallout = YES;
    }
    view.annotation = annotation;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    //imageView.image = [UIImage systemImageNamed:@"sun.max.fill"];
    view.leftCalloutAccessoryView = imageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    return view;
}

-(void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    if([view.leftCalloutAccessoryView isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *)view.leftCalloutAccessoryView;
        id<MKAnnotation> annotation = view.annotation;
        if([annotation isKindOfClass:[City class]]){
            City *c = (City *)annotation;
            NSString *w = [c.weatherList getAtIndex:0].condition;
            if ([ w isEqualToString:@"Sunny"]) {
                imageView.image = [UIImage systemImageNamed:@"sun.max.fill"];
            }else if ([ w isEqualToString:@"Rainy"]) {
                imageView.image = [UIImage systemImageNamed:@"cloud.rain.fill"];
            }else if ([ w isEqualToString:@"Cloudy"]){
                imageView.image = [UIImage systemImageNamed:@"cloud.fill"];
            }else if ([ w isEqualToString:@"sunAndCloud"]){
                imageView.image = [UIImage systemImageNamed:@"cloud.sun.fill"];
            }
        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    if([control isEqual:view.rightCalloutAccessoryView]){
        [self performSegueWithIdentifier:@"ShowWeather" sender:view];
    }
}

- (void) centerMapToLocation:(CLLocationCoordinate2D)location
                        zoom:(double)zoom{
    MKCoordinateRegion mapRegion;
    mapRegion.center = location;
    mapRegion.span.latitudeDelta = zoom;
    mapRegion.span.longitudeDelta = zoom;
    [self.mapView setRegion:mapRegion];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowWeather"]) {
        if ([segue.destinationViewController isKindOfClass:[WeatherViewController class]]) {
            WeatherViewController *vc = (WeatherViewController *)segue.destinationViewController;
            if ([sender isKindOfClass:[MKAnnotationView class]]) {
                MKAnnotationView *view = (MKAnnotationView *)sender;
                id<MKAnnotation> annotation = view.annotation;
                if([annotation isKindOfClass:[City class]]){
                    City *c = (City *)annotation;
                    vc.citySearched = c;
                }
            }
        }
    }
}


@end
