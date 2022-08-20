//
//  Weather.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

- (instancetype) initWithCondition: (NSString*) condition
                              date: (NSString*) date
                   low_temperature: (int) TLow
                  high_temperature: (int) THigh;

@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, readonly) int TLow;
@property (nonatomic, readonly) int THigh;
@property (nonatomic, readonly) NSString *displayWeather;
@end
