//
//  FavoriteListTableViewController.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 18/08/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteListTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *favoriteList;

@end

NS_ASSUME_NONNULL_END
