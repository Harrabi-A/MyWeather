//
//  User.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "FavoriteList.h"

@interface User : NSObject{
    //City *city;
    //FavoriteList *favoriteList;
}

@property (nonatomic, strong) City* city;
@property (nonatomic, strong) FavoriteList* favoriteList;

+ (User *)sharedUser;

@end
