//
//  SearchViewController.m
//  MyWeather
//
//  Created by Ahmed Harrabi on 19/08/22.
//

#import "SearchViewController.h"
#import "ExampleCityDataSource.h"
#import "City.h"

@interface SearchViewController (){
    BOOL searchState;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*




- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
}
*/
@end
