//
//  City.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import "City.h"

@implementation City

- (instancetype) initWithName:(NSString *)name
                     position:(Poi *)position
                  weatherList:(WeatherList *)weatherList{
    if (self = [super init]) {
        _name = [name copy];
        _position = position;
        _weatherList = weatherList;
    }
    return self;
}

@end
