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
#import "MaoAppDelegate.h"
#import "CustomAlertWindow.h"
@interface CleanDetailCheckTableViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnOrder;

@property (weak, nonatomic) IBOutlet UIButton *btnCall;
@end

@implementation CleanDetailCheckTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.tableView.backgroundColor=[UIColor redColor];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.detailViewModel=[[CleanDetailCheckViewModel alloc]init];
    [[CleanService defaultService] loadServiceOrderSelections];
    __weak id weakSelf=self;
   [[ RACObserve(self, detailViewModel.detaileChecks) map:^id(NSArray *value) {
       if ([value count]) {
           __strong CleanDetailCheckTableViewController *strongSelf=weakSelf;
           [strongSelf.tableView reloadData];
       }
      
        return value;
    }]subscribeNext:^(id x) {}];
    
    [[RACObserve(self, detailViewModel.orderSuccess) map:^id(id value) {
        if ([value boolValue]) {
            MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
            NSString *userphone=[delegate.hostUser objectForKey:@"username"];
            
            NSString *message=[NSString stringWithFormat:@"预约订单已经发送\n稍后客服人员会通过\n%@\n联系您",userphone];
            [CustomAlertWindow showWithText:message];        }
        return value;
    }]subscribeNext:^(id x) {}];
    // Do any additional setup after loading the view.
}
- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    //cell.contentView.backgroundColor =[UIColor redColor];
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   CleanDetailCheckModel *model= [self.detailViewModel.detaileChecks objectAtIndex:indexPath.row];
    BOOL choosed=[model.choosed boolValue];
    model.choosed=@(!choosed);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)dealloc{
    NSLog(@"%@ dealloc",self);
}
@end
