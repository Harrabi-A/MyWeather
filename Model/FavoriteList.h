//
//  FavoriteList.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface FavoriteList : NSObject

- (long)size;
- (NSArray*)getAll;
- (void)add:(City*)c;
- (void)remove:(City*)c;
- (City *)getAtIndex:(NSInteger)index;
- (BOOL)isFavorite:(City*)c;

@end
