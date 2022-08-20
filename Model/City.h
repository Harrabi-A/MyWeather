//
//  City.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import <Foundation/Foundation.h>
#import "Poi.h"
#import "WeatherList.h"

@interface City :NSObject

- (instancetype) initWithName: (NSString*) name
                     position: (Poi*) position
                  weatherList: (WeatherList *) weatherList;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) Poi* position;
@property (nonatomic, strong) WeatherList* weatherList;

@end
