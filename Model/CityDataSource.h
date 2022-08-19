//
//  CityDataSource.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 13/08/22.
//
#import <Foundation/Foundation.h>
#import "City.h"

@protocol CityDataSource <NSObject>

- (City*)getCityByName:(NSString*)city_name;
- (NSMutableArray *)getAll;

@end
