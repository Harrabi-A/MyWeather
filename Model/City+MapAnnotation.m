//
//  City+MapAnnotation.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 20/08/22.
//

#import "City+MapAnnotation.h"

@implementation City (MapAnnotation)

- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.position.latitude;
    coordinate.longitude = self.position.longitude;
    return coordinate;
}

- (NSString *)title{
    return self.name;
}

- (NSString *)subtitle{
    Weather *w = [self.weatherList getAtIndex:0];
    return [NSString stringWithFormat:@"%@: %d/%d",w.condition,w.TLow,w.THigh];
}

- (NSString *)weatherCondition{
    Weather *w = [self.weatherList getAtIndex:0];
    return w.condition;
}

@end
