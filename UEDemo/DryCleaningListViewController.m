//
//  DryCleaningListViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningListViewController.h"
#import "DryCleaningViewModel.h"
#import "DryCleaningCell.h"
#import "DryCleaningOrderViewController.h"
@interface DryCleaningListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DryCleaningListViewController


- (IBAction)dismis:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dryViewModel=[[DryCleaningViewModel alloc]init];
    [[RACObserve(self, dryViewModel.drySourceData) map:^id(id value) {
        [self.tableView reloadData];
        return value;
    }]subscribeNext:^(id x) {}];
        
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dryViewModel.drySourceData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DryCleaningCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dryCell" ];
    
    [cell setSourceData:[self.dryViewModel.drySourceData objectAtIndex:indexPath.row]];
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DryCleaningOrderViewController *orderVC=(DryCleaningOrderViewController*)segue.destinationViewController;
    orderVC.dryViewModel=self.dryViewModel;
}


@end
