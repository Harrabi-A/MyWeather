//
//  ExampleCityDataSource.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 13/08/22.
//

#import "ExampleCityDataSource.h"
#import "City.h"
#import "Poi.h"
#import "WeatherList.h"

@interface ExampleCityDataSource()

@property (nonatomic, strong) NSMutableArray *cities;
@property (nonatomic, strong) WeatherList * weatherExampleList;

- (City*)getCityByName:(NSString*)city_name;
- (NSMutableArray *)getAll;

@end

@implementation ExampleCityDataSource

- (instancetype)init{
    if (self = [super init]) {
        _cities = [[NSMutableArray alloc] init];
        _weatherExampleList = [[WeatherList alloc] init];
        [self addWeatherExampleList];
        [self addCities];
    }
    return self;
}

-(void)addWeatherExampleList{
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Sunny"
                           date:@"Monday Sep 5th"
                           low_temperature:23
                           high_temperature:32
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"sunAndCloud"
                           date:@"Tuesday Sep 6th"
                           low_temperature:23
                           high_temperature:34
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Sunny"
                           date:@"Wednsaday Sep 7th"
                           low_temperature:23
                           high_temperature:32
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Sunny"
                           date:@"Thursday Sep 8th"
                           low_temperature:23
                           high_temperature:32
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Sunny"
                           date:@"Friday Sep 9th"
                           low_temperature:23
                           high_temperature:32
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Rainy"
                           date:@"Saturday Sep 10th"
                           low_temperature:20
                           high_temperature:22
                          ]
    ];
    [self.weatherExampleList add:[[Weather alloc]
                           initWithCondition:@"Cloudy"
                           date:@"Sunday Sep 11th"
                           low_temperature:23
                           high_temperature:25
                           ]
    ];
}

- (void)addCities{
    [self.cities addObject:[[City alloc]
                            initWithName:@"Milan"
                                position:[[Poi alloc]
                                          initWithName:@"Milan"
                                          latitude:45.4654219
                                          longitude:9.1859243
                                         ]
                            weatherList:self.weatherExampleList
//weatherList:[[WeatherList alloc] init]
                           ]
    ];
    [self.cities addObject:[[City alloc]
                            initWithName:@"Parma"
                                position:[[Poi alloc]
                                          initWithName:@"Parma"
                                          latitude:44.801485
                                          longitude:10.3279036
                                         ]
                            weatherList:self.weatherExampleList
                            //weatherList:[[WeatherList alloc] init]
                           ]
    ];
    [self.cities addObject:[[City alloc]
                            initWithName:@"Rome"
                                position:[[Poi alloc]
                                          initWithName:@"Rome"
                                          latitude:41.9027835
                                          longitude:12.4963655
                                         ]
                            weatherList:self.weatherExampleList
                            //weatherList:[[WeatherList alloc] init]
                           ]
    ];
    [self.cities addObject:[[City alloc]
                            initWithName:@"London"
                                position:[[Poi alloc]
                                          initWithName:@"London"
                                          latitude:51.509865
                                          longitude:-0.118092
                                         ]
                            weatherList:self.weatherExampleList
                            //weatherList:[[WeatherList alloc] init]
                           ]
    ];
    [self.cities addObject:[[City alloc]
                            initWithName:@"Vancouver"
                                position:[[Poi alloc]
                                          initWithName:@"Vancouver"
                                          latitude:49.246292
                                          longitude:-123.116226
                                         ]
                            weatherList:self.weatherExampleList
                            //weatherList:[[WeatherList alloc] init]
                           ]
    ];
    [self.cities addObject:[[City alloc]
                            initWithName:@"San Francisco"
                                position:[[Poi alloc]
                                          initWithName:@"San Francisco"
                                          latitude:37.773972
                                          longitude:-122.431297
                                         ]
                            weatherList:self.weatherExampleList
                            //weatherList:[[WeatherList alloc] init]
                           ]
    ];
    
    /*
    for (int i=0; i<[self.cities count]; i++) {
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Sunny"
                               date:@"Monday Sep 5th"
                               low_temperature:23
                               high_temperature:32
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Sunny"
                               date:@"Tuesday Sep 6th"
                               low_temperature:23
                               high_temperature:34
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Sunny"
                               date:@"Wednsaday Sep 7th"
                               low_temperature:23
                               high_temperature:32
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Sunny"
                               date:@"Thursday Sep 8th"
                               low_temperature:23
                               high_temperature:32
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Sunny"
                               date:@"Friday Sep 9th"
                               low_temperature:23
                               high_temperature:32
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Rainny"
                               date:@"Saturday Sep 10th"
                               low_temperature:20
                               high_temperature:22
                              ]
        ];
        [[self.cities objectAtIndex:i] add:[[Weather alloc]
                               initWithCondition:@"Cloudy"
                               date:@"Sunday Sep 11th"
                               low_temperature:23
                               high_temperature:25
                              ]
        ];
    }*/
}

- (City *)getCityByName:(NSString*)city_name{
    for (int i=0; i < [self.cities count]; i++) {
        City *tmp_city = [self.cities objectAtIndex:i];
        if (tmp_city.name == city_name) {
            return tmp_city;
        }
    }
    return nil;
}

- (NSMutableArray *)getAll{
    return self.cities;
}

@end


