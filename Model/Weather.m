//
//  Weather.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import "Weather.h"

@implementation Weather

- (instancetype) initWithCondition:(NSString *)condition
                              date:(NSString *)date
                   low_temperature:(int)TLow
                  high_temperature:(int)THigh{
    
    if (self = [super init]) {
        _condition = [condition copy];
        _date = [date copy];
        _TLow = TLow;
        _THigh = THigh;
    }
    return self;
}

- (NSString*)displayWeather{
    return [NSString stringWithFormat:@"%@  T°: %d/%d ", self.date,self.TLow, self.THigh];
}

@end
