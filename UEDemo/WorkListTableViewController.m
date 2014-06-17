//
//  WorkListTableViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "WorkListTableViewController.h"
#import "WorkerListViewModel.h"
#import "WorkCell.h"
#import "Worker.h"
#import "WorkerOrderViewController.h"
@interface WorkListTableViewController ()


@end

@implementation WorkListTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.backgroundView =
//    [[UIImageView alloc]initWithImage:
//     [[UIImage imageNamed:@"login_background"] stretchableImageWithLeftCapWidth:0.0
//                                                                 topCapHeight:5.0]];
//    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
//    // 透明度设置为0.3
//    self.navigationController.navigationBar.alpha = 0.300;
//    // 设置为半透明
//    self.navigationController.navigationBar.translucent = YES;
    
    self.listViewModel=[[WorkerListViewModel alloc]init];
    [self.listViewModel loadWorkerList];
   __weak id weakSelf=self;
    [[RACObserve(self, listViewModel.workerList) map:^id(id value) {
        
        __strong WorkListTableViewController *strongSelf=weakSelf;
        [strongSelf.tableVIew reloadData];
        
        return value;
    }]subscribeNext:^(id x) {
        
    }];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listViewModel.workerList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorkCell"];
    
    Worker *worker=[self.listViewModel.workerList objectAtIndex:indexPath.row];
    cell.worker=worker;
    cell.lbName.text=worker.name;
    cell.lbPrice.text=worker.prices;
    cell.lbSkills.text=[worker skillsString];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WorkCell *cell=(WorkCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    BOOL selected=[cell.worker.selected boolValue];
    cell.worker.selected=@(!selected);
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)pushOrder:(id)sender {
    WorkerOrderViewController *orderVC=[self.storyboard instantiateViewControllerWithIdentifier:@"WorkerOrder"];
    orderVC.listViewModel=self.listViewModel;
    [self.navigationController pushViewController:orderVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
    NSLog(@"%@ dealloc",self);
}
@end
