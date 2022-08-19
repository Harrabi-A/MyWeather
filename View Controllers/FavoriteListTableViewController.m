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

@interface FavoriteListTableViewController ()

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
/*
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cellFavorite = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cellFavorite.textLabel.text = @"PROVA";
    return cellFavorite;
}*/

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
