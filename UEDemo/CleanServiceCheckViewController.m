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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lbTitle.text=[NSString stringWithFormat:@"您选择了%@",self.serviceViewModel.title];
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
    CheckViewCell *cell=(CheckViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    BOOL choosed=[cell.orderSelection.choosed boolValue];
    cell.orderSelection.choosed=@(!choosed);
    [self chooseChanged];
}
-(void)chooseChanged{
    float price=0;
    for (OrderSelection *s in self.serviceViewModel.selections) {
        if ([s.choosed boolValue]) {
             price=price+[s.price floatValue];
        }
       
    }
    self.lbPrice.text=[NSString stringWithFormat:@"%.2f",price];
}
@end
