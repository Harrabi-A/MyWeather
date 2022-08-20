//
//  User.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "City.h"
#import "FavoriteList.h"
#import "Poi.h"

@implementation User

+ (User *)sharedUser {
    static User *sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

- (id)init{
    if (self = [super init]) {
        self.city = [[City alloc] initWithName:@"Parma" position:[[Poi alloc]initWithName:@"Parma" latitude:44.801472 longitude:10.328000] weatherList:[[WeatherList alloc]init]];
        self.favoriteList = [[FavoriteList alloc] init];
    }
    return self;
}

@end
