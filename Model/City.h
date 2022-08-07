//
//  City.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 07/08/22.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

- (instancetype) initWithName:(NSString*)name
                     latitude:(double) latitude
                    longitude:(double) longitude;

@property(nonatomic, strong) NSString* name;
@property double latitude;
@property double longitude;

@end
