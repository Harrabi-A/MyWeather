//
//  SearchViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 19/08/22.
//

#import "SearchViewController.h"
#import "ExampleCityDataSource.h"
#import "City.h"
#import "WeatherViewController.h"

@interface SearchViewController (){
    BOOL searchState;
    City *selectedCity;
}

@property (nonatomic, strong) NSMutableArray *selectedCities;
@property (nonatomic, strong) NSMutableArray *allCities;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cities.dataSource = self;
    self.cities.delegate = self;
    self.search.delegate = self;
    self.allCities = [[[ExampleCityDataSource alloc]init]getAll ];
    searchState = false;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length == 0) {
        searchState = false;
    }else{
        searchState = true;
        self.selectedCities = [[NSMutableArray alloc] init];
        for (City *c in self.allCities) {
            NSRange nameRange = [c.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (nameRange.location != NSNotFound){
                [self.selectedCities addObject:c];
            }
        }
    }
    [self.cities reloadData];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (searchState) {
        return [self.selectedCities count];
    }else{
        return [self.allCities count];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (searchState) {
        City *c = [self.selectedCities objectAtIndex:indexPath.row];
        cell.textLabel.text = c.name;
        return cell;
    }else{
        City *c = [self.allCities objectAtIndex:indexPath.row];
        cell.textLabel.text = c.name;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (searchState) {
        selectedCity = [_selectedCities objectAtIndex:indexPath.row];
    }else{
        selectedCity = [_allCities objectAtIndex:indexPath.row];
    }
    NSLog(@"%@",selectedCity.name);
    [self performSegueWithIdentifier:@"ShowSearchedCity" sender:nil];
}


 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if([segue.identifier isEqualToString:@"ShowSearchedCity"]){
         if([segue.destinationViewController isKindOfClass:[WeatherViewController class]]){
             WeatherViewController *vc = (WeatherViewController *)segue.destinationViewController;
             vc.citySearched = selectedCity;
             NSLog(@"%@",vc.citySearched.name);
         }
     }
 }

@end
