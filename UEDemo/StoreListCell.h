//
//  StoreListCell.h
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreListViewController.h"
@interface StoreListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (nonatomic)    NSDictionary *store;
@property (nonatomic)    NSNumber  *choosed;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIImageView *imgChecked;
@property (weak, nonatomic) StoreListViewController *contextController;
-(void)setWithStore:(NSDictionary*)store;
@end
