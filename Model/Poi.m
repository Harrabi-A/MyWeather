//
//  Poi.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import "Poi.h"

@implementation Poi

-(instancetype) initWithName: (NSString*) name
                    latitude: (double) latitude
                   longitude: (double) longitude{
    if (self = [super init]) {
        _name = [name copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}


@end

