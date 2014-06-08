//
//  CleanDetailCheckTableViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanDetailCheckTableViewController.h"
#import "DetailCheckCell.h"
#import "CleanDetailCheckViewModel.h"
#import "CleanDetailCheckModel.h"
#import "CleanService.h"
@interface CleanDetailCheckTableViewController ()

@end

@implementation CleanDetailCheckTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.detailViewModel=[[CleanDetailCheckViewModel alloc]init];
    [[CleanService defaultService] loadServiceOrderSelections];
   [[ RACObserve(self, detailViewModel.detaileChecks) map:^id(id value) {
       
       [self.tableView reloadData];
        return value;
    }]subscribeNext:^(id x) {}];
    
    [[RACObserve(self, detailViewModel.orderSuccess) map:^id(id value) {
        if ([value boolValue]) {
            UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanOrderSuccess"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        return value;
    }]subscribeNext:^(id x) {}];
    // Do any additional setup after loading the view.
}
- (IBAction)subDetailOrders:(id)sender {
    [self.detailViewModel subDetailOrders];
}
-(void)dismiss{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.detailViewModel.detaileChecks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCheckCell *cell=[tableView dequeueReusableCellWithIdentifier:@"DetailCheckCell"];
     CleanDetailCheckModel *model=[self.detailViewModel.detaileChecks objectAtIndex:indexPath.row];
    cell.detailModel=model;
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   CleanDetailCheckModel *model= [self.detailViewModel.detaileChecks objectAtIndex:indexPath.row];
    BOOL choosed=[model.choosed boolValue];
    model.choosed=@(!choosed);
}
@end
