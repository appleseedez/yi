//
//  MyCentreTableViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MyCentreTableViewController.h"
#import "MyCenterViewModel.h"
#import "MyCenterOrderCell.h"
#import "OrderStatusView.h"
@interface MyCentreTableViewController ()

@end

@implementation MyCentreTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.centerViewModel=[MyCenterViewModel new];
    [self.centerViewModel refreshOrders];
   [[ RACObserve(self, centerViewModel.myOrders) map:^id(NSArray *value) {
       [self.tableView reloadData];
       
        return value;
    }]subscribeNext:^(id x) {}];
    
}

-(IBAction)dismiss:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.centerViewModel.myOrders count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCenterOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CenterOrderCell" ];
    
    NSDictionary *order=[self.centerViewModel.myOrders objectAtIndex:indexPath.row];
    
    NSString *orderType=[order objectForKey:@"ordertype"];
    NSString *title=nil;
    if ([orderType isEqualToString:@"bj"]) {
        title=@"保洁订单";
    }else if ([orderType isEqualToString:@"gx"]){
        title=@"干洗订单";
    }else if ([orderType isEqualToString:@"zd"]){
        title=@"钟点工订单";
    }
    cell.lbTitle.text=title;
    NSInteger status=[[order objectForKey:@"status"] integerValue];
    [cell setStatusView:[OrderStatusView viewWithStatusType:status]];
    return cell;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
      return 54;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
