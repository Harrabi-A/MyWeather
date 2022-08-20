//
//  WeatherViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 15/08/22.
//

#import <CoreLocation/CoreLocation.h>
#import "WeatherViewController.h"
#import "City.h"
#import "User.h"
#import "ExampleCityDataSource.h"
#import "CityDataSource.h"
#import "FavoriteList.h"

@interface WeatherViewController()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@interface WeatherViewController(){
    CLLocation *currentLocation;
}

@property (nonatomic, strong) City *localCity;

@property (nonatomic, strong) User *user;

@property (weak, nonatomic) IBOutlet UILabel *lblCityName;

@property (nonatomic, strong) IBOutlet UIButton *btnAddFavorite;

@property (weak, nonatomic) IBOutlet UILabel *lblWeather0;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather1;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather2;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather3;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather4;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather5;
@property (weak, nonatomic) IBOutlet UILabel *lblWeather6;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather0;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather1;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather2;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather3;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather4;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather5;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather6;

@property (nonatomic, strong) NSMutableArray *imgList;
@property (nonatomic, strong) NSMutableArray *conditionList;

@end

@implementation WeatherViewController



- (void)viewDidLoad{
    if (self.citySearched .name == nil) {
        self.city = [[[ExampleCityDataSource alloc]init]getCityByName:@"Parma"];
    }else{
        self.city = self.citySearched;
    }
    self.localCity = [[[ExampleCityDataSource alloc]init]getCityByName:@"Parma"];
    //_user = [[User alloc]init];
    self.lblCityName.text = self.city.name;
    
    self.imgList = [[NSMutableArray alloc]init];
    self.conditionList = [[NSMutableArray alloc] init];
    [self.imgList addObject: _imgWeather0];
    [self.imgList addObject: _imgWeather1];
    [self.imgList addObject: _imgWeather2];
    [self.imgList addObject: _imgWeather3];
    [self.imgList addObject: _imgWeather4];
    [self.imgList addObject: _imgWeather5];
    [self.imgList addObject: _imgWeather6];
    //NSString *user_city = [User sharedUser].city.name;
    //NSLog(@"%@ from Weather scene (LOAD) ",user_city);
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [self.locationManager startUpdatingLocation];
    currentLocation = [self.locationManager location];
    NSLog(@"%f", currentLocation.coordinate.latitude);
    NSLog(@"%f", currentLocation.coordinate.longitude);
    
    //[self.locationManager requestLocation];
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.lblWeather0.text = [[self.city.weatherList getAtIndex:0]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:0] condition]];
    //self.imgWeather0.image = [UIImage systemImageNamed:@"sun.max.fill" ];
    
    self.lblWeather1.text = [[self.city.weatherList getAtIndex:1]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:1] condition]];
    
    self.lblWeather2.text = [[self.city.weatherList getAtIndex:2]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:2] condition]];
    
    self.lblWeather3.text = [[self.city.weatherList getAtIndex:3]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:3] condition]];
    
    self.lblWeather4.text = [[self.city.weatherList getAtIndex:4]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:4] condition]];
    
    self.lblWeather5.text = [[self.city.weatherList getAtIndex:5]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:5] condition]];
    
    self.lblWeather6.text = [[self.city.weatherList getAtIndex:6]displayWeather];
    [self.conditionList addObject:[[self.city.weatherList getAtIndex:6] condition]];
    
    for (int i=0; i<[self.imgList count]; i++) {
        NSString *weatherCondition = [[NSString alloc] init];
        weatherCondition = [self.conditionList objectAtIndex:i];
        if ([ weatherCondition isEqualToString:@"Sunny"]) {
            UIImageView *tmp_sun_img = [self.imgList objectAtIndex:i];
            tmp_sun_img.image = [UIImage systemImageNamed:@"sun.max.fill" ];
            tmp_sun_img.tintColor = [UIColor whiteColor];
        }else if ([ weatherCondition isEqualToString:@"Rainy"]) {
            UIImageView *tmp_rain_img = [self.imgList objectAtIndex:i];
            tmp_rain_img.image = [UIImage systemImageNamed:@"cloud.rain.fill" ];
            tmp_rain_img.tintColor = [UIColor whiteColor];
        }else if ([ weatherCondition isEqualToString:@"Cloudy"]){
            UIImageView *tmp_cloud_img = [self.imgList objectAtIndex:i];
            tmp_cloud_img.image = [UIImage systemImageNamed:@"cloud.fill" ];
            tmp_cloud_img.tintColor = [UIColor whiteColor];
        }else if ([ weatherCondition isEqualToString:@"sunAndCloud"]){
            UIImageView *tmp_sunCloud_img = [self.imgList objectAtIndex:i];
            tmp_sunCloud_img.image = [UIImage systemImageNamed:@"cloud.sun.fill" ];
            tmp_sunCloud_img.tintColor = [UIColor whiteColor];
        }
            
    }
    
    FavoriteList *favList = [User sharedUser].favoriteList;
    if ([favList isFavorite:self.city]){
        [self.btnAddFavorite setTitle:@"Remove from favorite" forState:UIControlStateNormal];
    }else{
        [self.btnAddFavorite setTitle:@"Add to favorite" forState:UIControlStateNormal];
    }
}

- (IBAction)btnAddFavoriteAction:(id)sender {
    NSLog(@"button pressed");
    if ([self.btnAddFavorite.titleLabel.text isEqual:@"Remove from favorite"]) {
        NSLog(@"Remove Selected");
        [[User sharedUser].favoriteList remove:self.city];
        [self.btnAddFavorite setTitle:@"Add to favorite" forState:UIControlStateNormal];
    }else if([self.btnAddFavorite.titleLabel.text isEqual:@"Add to favorite"]){
        NSLog(@"Add Selected");
        [[User sharedUser].favoriteList add:self.city];
        [self.btnAddFavorite setTitle:@"Remove from favorite" forState:UIControlStateNormal];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *currentLocation = [locations lastObject];
    [User sharedUser].city.position.latitude = currentLocation.coordinate.latitude;
    [User sharedUser].city.position.longitude = currentLocation.coordinate.longitude;
    NSLog(@"lat: %f long: %f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
}

@end
