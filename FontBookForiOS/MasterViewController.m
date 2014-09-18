//
//  MasterViewController.m
//  FontBookForiOS
//
//  Created by Brian Papa on 9/18/14.
//  Copyright (c) 2014 bpm apps LLC. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSArray *fontNames;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *fontNamesMutable = [NSMutableArray array];
    
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        [fontNamesMutable addObjectsFromArray:[UIFont fontNamesForFamilyName:familyName]];
    }
    
    self.fontNames = fontNamesMutable;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue.destinationViewController setDetailItem:self.fontNames[[sender row]]];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = self.fontNames[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:self.fontNames[indexPath.row] size:[UIFont systemFontSize]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
}

@end
