//
//  CleanWatchCell.h
//  UEDemo
//
//  Created by nsc on 14-6-12.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CleanServiceTableViewController.h"
#import "ServiceModel.h"
@interface CleanWatchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnWatch;
@property  (weak,nonatomic) CleanServiceTableViewController *controller;
@property (nonatomic,strong) ServiceModel *model;
@end
