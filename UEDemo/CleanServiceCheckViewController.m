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
@interface CleanServiceCheckViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;

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
    
    self.lbTitle.text=[NSString stringWithFormat:@"您选择了%@",self.serviceViewModel.title];
    
    [self.serviceViewModel.orderSuccess subscribeCompleted:^{
        UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanOrderSuccess"];
        [self.navigationController pushViewController:vc animated:YES];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

@end
