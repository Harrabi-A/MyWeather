//
//  SearchViewController.h
//  MyWeather
//
//  Created by Ahmed Harrabi on 19/08/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UITableView *cities;

@property (nonatomic, strong) IBOutlet UISearchBar *search;

@end

NS_ASSUME_NONNULL_END
