//
//  WeatherViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 15/08/22.
//

#import "WeatherViewController.h"
#import "City.h"
#import "User.h"
#import "ExampleCityDataSource.h"
#import "CityDataSource.h"

@interface WeatherViewController()

@property (nonatomic, strong) City *city;
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
    self.city = [[[ExampleCityDataSource alloc]init]getCityByName:@"Parma"];
    self.localCity = [[[ExampleCityDataSource alloc]init]getCityByName:@"Parma"];
    //_user = [[User alloc]init];
    self.lblCityName.text = self.city.name;
    NSLog(@"Prepering for segue (passing data %@)",self.city.name);
    
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
    
}

- (void)viewWillAppear:(BOOL)animated{
    /*NSString *user_city = [User sharedUser].city.name;
    NSLog(@"%@ from Weather scene",user_city);*/
    //NSLog(@"%@",[[self.city.weatherList getAtIndex:1]displayWeather]);
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
        NSLog(@"%d",i);
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
}
/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.city.weatherList.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell" forIndexPath:indexPath];
    Weather *w = [self.city.weatherList getAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = w.displayWeather;
    return cell;
}*/
- (IBAction)btnAddFavoriteAction:(id)sender {
    NSLog(@"button pressed");
    //NSLog(@"%long",[self.user.favoriteList size]);
    if ([self.btnAddFavorite.titleLabel.text isEqual:@"Remove from favorite"]) {
        NSLog(@"Remove Selected");
        //[self.user.favoriteList remove:self.city];
        [[User sharedUser].favoriteList remove:self.city];
        [self.btnAddFavorite setTitle:@"Add to favorite" forState:UIControlStateNormal];
    }else if([self.btnAddFavorite.titleLabel.text isEqual:@"Add to favorite"]){
        NSLog(@"Add Selected");
        //[self.user.favoriteList add:self.city];
        [[User sharedUser].favoriteList add:self.city];
        [self.btnAddFavorite setTitle:@"Remove from favorite" forState:UIControlStateNormal];
    }
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Prepering for segue1 (passing data %@)",self.city.name);
    if([segue.identifier isEqualToString:@"ShowWeatherList"]){
        if([segue.destinationViewController isKindOfClass:[WeatherTableViewController class]]){
            WeatherTableViewController *vc = (WeatherTableViewController *)segue.destinationViewController;
            vc.city = self.city;
        }
    }
    
}*/

@end
