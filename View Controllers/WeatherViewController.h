//
//  WeatherViewController.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 15/08/22.
//

#import <UIKit/UIKit.h>
#import "CityDataSource.h"

@interface WeatherViewController : UIViewController

@property (nonatomic, strong) id<CityDataSource> dataSource;
@end
