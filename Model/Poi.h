//
//  Poi.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import <Foundation/Foundation.h>

@interface Poi : NSObject

- (instancetype) initWithName:(NSString *)name
                     latitude:(double)latitude
                    longitude:(double)longitude;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@end
