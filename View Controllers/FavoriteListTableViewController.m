//
//  FavoriteListTableViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 18/08/22.
//

#import "FavoriteListTableViewController.h"
#import "User.h"
#import "City.h"
#import "FavoriteList.h"
#import "WeatherViewController.h"

@interface FavoriteListTableViewController (){
    City *selectedCity;
}

@property (nonatomic, strong) FavoriteList *list;

@end

@implementation FavoriteListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favoriteList.dataSource = self;
    self.favoriteList.delegate =self;
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.list = [User sharedUser].favoriteList;
    NSLog(@"element in favoriteList %long",[User sharedUser].favoriteList.size);
    [self.favoriteList reloadData];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list size];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cellFavorite = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    City *c = [self.list getAtIndex:indexPath.row];
    cellFavorite.textLabel.text = c.name;
    return cellFavorite;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedCity = [self.list getAtIndex:indexPath.row];

    [self performSegueWithIdentifier:@"ShowFavoriteSelectedCity" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowFavoriteSelectedCity"]){
        if([segue.destinationViewController isKindOfClass:[WeatherViewController class]]){
            WeatherViewController *vc = (WeatherViewController *)segue.destinationViewController;
            NSLog(@"from FAVORITE VIEW slected city to pass is: %@",selectedCity.name);
            vc.citySearched = selectedCity;
        }
    }
    
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"VIEW DISAPEAR");
}

@end
