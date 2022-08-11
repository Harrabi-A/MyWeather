//
//  WeatherList.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherList : NSObject

- (long)size;
- (NSArray *)getAll;
- (void)add:(Weather *)w;
- (Weather *)getAtIndex:(NSInteger)index;

@end
