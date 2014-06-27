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
#import "MyCenterPersionalSettingController.h"
#import "OrderWaitingServiceViewController.h"
#import "NSDictionary+killNull.h"
@interface MyCentreTableViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation MyCentreTableViewController



- (void)viewDidLoad {
	[super viewDidLoad];
	self.centerViewModel = [MyCenterViewModel new];
    
	__weak id weakSelf = self;
    
	[[RACObserve(self, centerViewModel.myOrders) map: ^id (NSArray *value) {
	    __strong MyCentreTableViewController *strongSelf = weakSelf;
	    [strongSelf.tableView reloadData];
        
	    return value;
	}]subscribeNext: ^(id x) {}];
	//监听HUD
	[[RACObserve(self, centerViewModel.busy) map: ^id (NSNumber *value) {
	    __strong MyCentreTableViewController *strongSelf = weakSelf;
	    if ([value boolValue]) {
	        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:strongSelf.view animated:YES];
	        hud.labelText = @"请稍后";
		}
	    else {
	        [MBProgressHUD hideAllHUDsForView:strongSelf.view animated:YES];
		}
        
	    return value;
	}]subscribeNext: ^(id x) {}];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.centerViewModel refreshOrders];
}

- (IBAction)dismiss:(id)sender {
	[self.centerViewModel backToRootVC:self.navigationController];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.centerViewModel.myOrders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MyCenterOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CenterOrderCell"];
    
	NSDictionary *order = [self.centerViewModel.myOrders objectAtIndex:indexPath.row];
    
	NSString *orderType = [order objectForKey:@"ordertype"];
	NSString *title = nil;
	if ([orderType isEqualToString:@"bj"]) {
		title = @"保洁订单";
	}
	else if ([orderType isEqualToString:@"gx"]) {
		title = @"干洗订单";
	}
	else if ([orderType isEqualToString:@"zd"]) {
		title = @"钟点工订单";
	}
	cell.lbTitle.text = title;
	NSInteger status = [[order objectForKey:@"status"] integerValue];
	NSString *statusLogoEndStr = nil;
	switch (status) {
		case 0:
			cell.lbStatus.text = @"未服务";
			statusLogoEndStr = @"wfw";
			break;
            
		case 1:
			cell.lbStatus.text = @"未服务";
			statusLogoEndStr = @"wfw";
			break;
            
		case 2:
			cell.lbStatus.text = @"服务中";
			statusLogoEndStr = @"fwz";
			break;
            
		case 3:
			cell.lbStatus.text = @"已完成";
			statusLogoEndStr = @"ywc";
			break;
            
		case 4:
			cell.lbStatus.text = @"已取消";
			statusLogoEndStr = @"yqx";
			break;
            
		default:
			break;
	}
    cell.lbDate.text=[order objectForKey:@"updatetime"];
    cell.lbOrderNo.text=[order objectForKey:@"orderno"];
	cell.imgHeader.image = [UIImage imageNamed:[NSString stringWithFormat:@"center_%@_%@", orderType, statusLogoEndStr]];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *order = [self.centerViewModel.myOrders objectAtIndex:indexPath.row];
	NSString *orderType = [order objectForKey:@"ordertype"];
	NSString *title = nil;
	if ([orderType isEqualToString:@"bj"]) {
		title = @"保洁订单";
	}
	else if ([orderType isEqualToString:@"gx"]) {
		title = @"干洗订单";
	}
	else if ([orderType isEqualToString:@"zd"]) {
		title = @"钟点工订单";
	}
    
	NSInteger status = [[order objectForKey:@"status"] integerValue];
	NSString *statusLogoEndStr = nil;
	switch (status) {
		case 0:
            
			statusLogoEndStr = @"wfw";
			break;
            
		case 1:
            
			statusLogoEndStr = @"wfw";
			break;
            
		case 2:
            
			statusLogoEndStr = @"fwz";
			break;
            
		case 3:
            
			statusLogoEndStr = @"ywc";
			break;
            
		case 4:
            
			statusLogoEndStr = @"yqx";
			break;
            
		default:
			break;
	}
	OrderWaitingServiceViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"orderView"];
	vc.order = [order killNull];
	[self.navigationController pushViewController:vc animated:YES];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	MyCenterPersionalSettingController *vc = segue.destinationViewController;
	vc.centerViewModel = self.centerViewModel;
}

- (void)dealloc {
	NSLog(@"%@ dealloc", self);
}

@end
