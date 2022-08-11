//
//  WeatherList.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 11/08/22.
//

#import "WeatherList.h"

@interface WeatherList()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation WeatherList

- (instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (long)size{
    return self.list.count;
}

- (NSArray *)getAll{
    return self.list;
}

- (void)add:(Weather *)w{
    [self.list addObject:w];
}

- (Weather *)getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

@end
