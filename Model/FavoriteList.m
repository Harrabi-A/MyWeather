//
//  FavoriteList.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 12/08/22.
//

#import "FavoriteList.h"

@interface FavoriteList()

@property (nonatomic, strong) NSMutableArray *list;

@end


@implementation FavoriteList

- (instancetype) init{
    if (self = [super init]) {
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray*)getAll{
    return self.list;
}

- (void)add:(City *)c{
    [self.list addObject:c];
}

- (void)remove:(City *)c{
    [self.list removeObject:c];
}

- (City*)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

- (BOOL)isFavorite:(City *)c{
    for (int i=0; i<[self.list count]; i++) {
        City* tmp_city = [self.list objectAtIndex:i];
        if (c.name == tmp_city.name) {
            return YES;
        }
    }
    return NO;
}

@end
