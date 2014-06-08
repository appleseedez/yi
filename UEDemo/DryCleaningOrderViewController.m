//
//  DryCleaningOrderViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningOrderViewController.h"
#import "DryCleaningViewModel.h"
#import "DryOrderCell.h"
@interface DryCleaningOrderViewController ()
@property (nonatomic) NSMutableArray *orderItems;
@end

@implementation DryCleaningOrderViewController


- (IBAction)subDryOrders:(id)sender {
    [self.dryViewModel subDryOrder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.orderItems=[NSMutableArray new];
    
    for (NSDictionary *d in self.dryViewModel.drySourceData) {
        NSInteger dryNum=[[d objectForKey:@"drynumber"]integerValue];
        if (dryNum) {
            [self.orderItems addObject:d];
        }
        
    }
    [[RACObserve(self, dryViewModel.orderSuccess) map:^id(id value) {
        if ([value boolValue]) {
            UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanOrderSuccess"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        return value;
    }]subscribeNext:^(id x) {}];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.orderItems count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DryOrderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"dryOrder"];
    NSDictionary *data=[self.orderItems objectAtIndex:indexPath.row];
    NSNumber *dryNumber=[data objectForKey:@"drynumber"];
    
    cell.lbItemName.text=[data objectForKey:@"name"];
    cell.lbItemNum.text=[NSString stringWithFormat:@"%@",dryNumber];
        cell.lbItemPrice.text=[self getPrice:data];
    return cell;
}


-(NSString*)getPrice:(NSDictionary*)data{
    NSNumber *dryNumber=[data objectForKey:@"drynumber"];
    float dryPrice=[[data objectForKey:@"dryprice"]floatValue];
    float ironingprice=[[data objectForKey:@"ironingprice"] floatValue];
    NSInteger ironingNumber=[[data objectForKey:@"ironingnumber"] integerValue];
    float price=dryPrice*[dryNumber integerValue]+ironingprice*ironingNumber;
    NSString *strPrice=[NSString stringWithFormat:@"%.2f",price];
    return strPrice;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView=[[UIView alloc]init];
    headerView.frame=CGRectMake(0, 0, 320, 40);
    UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(13, 5, 66, 17)];
    [name setFont:[UIFont fontWithName:@"System" size:13]];
    name.text=@"物品";
    [headerView addSubview:name];
    
    UILabel *number=[[UILabel alloc]initWithFrame:CGRectMake(137, 5, 46, 17)];
    [number setFont:[UIFont fontWithName:@"System" size:13]];
    number.text=@"数量";
    [headerView addSubview:number];
    
    UILabel *price=[[UILabel alloc]initWithFrame:CGRectMake(250, 5, 65, 17)];
    [price setFont:[UIFont fontWithName:@"System" size:13]];
    price.text=@"单价";
    [price setTextAlignment:NSTextAlignmentCenter];
    [headerView addSubview:price];
    headerView.backgroundColor=[UIColor whiteColor];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[[UIView alloc]init];
    footerView.frame=CGRectMake(0, 0, 320, 40);
    footerView.backgroundColor=[UIColor whiteColor];
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(13, 5, 66, 30)];
    title.text=@"总价";
    [footerView addSubview:title];
    float totalPrice=0;
    for (NSDictionary *d in self.orderItems) {
        float price=[[self getPrice:d] floatValue];
        totalPrice=totalPrice+price;
    }
    NSString *strTotalPrice=[NSString stringWithFormat:@"%.2f",totalPrice];
    
    UILabel *tPrice=[[UILabel alloc]initWithFrame:CGRectMake(250, 5, 66, 30)];
    tPrice.text=strTotalPrice;
    [footerView addSubview:tPrice];
    
    return footerView;
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

@end
