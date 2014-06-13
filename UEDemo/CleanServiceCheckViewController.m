//
//  CleanServiceCheckViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanServiceCheckViewController.h"
#import "CheckViewCell.h"
#import "OrderSelection.h"
#import "MaoAppDelegate.h"
#import "CustomAlertWindow.h"
@interface CleanServiceCheckViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnOrder;
@property (weak, nonatomic) IBOutlet UIButton *btnCall;

@end

@implementation CleanServiceCheckViewController


- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)subOrder:(id)sender {
    [self.serviceViewModel subOrders];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.btnOrder.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnOrder.layer.borderWidth=1;
    self.btnCall.layer.borderWidth=1;
    self.btnCall.layer.borderColor=[UIColor whiteColor].CGColor;
    self.lbTitle.text=[NSString stringWithFormat:@"您选择了%@",self.serviceViewModel.title];
    
    [[RACObserve(self, serviceViewModel.orderSuccess) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
            NSString *userphone=[delegate.hostUser objectForKey:@"username"];
            
            NSString *message=[NSString stringWithFormat:@"预约订单已经发送\n稍后客服人员会通过\n%@\n联系您",userphone];
            [CustomAlertWindow showWithText:message];
        }
        return value;
    }]subscribeNext:^(id x) {
        
    } completed:^{
        
    }];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.serviceViewModel.selections count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CheckViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CheckCell"];
    OrderSelection *selction=[self.serviceViewModel.selections objectAtIndex:indexPath.row];
    cell.lbTitle.text=selction.name;
    
    cell.orderSelection=selction;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end
