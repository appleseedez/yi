//
//  CleanDetailCheckTableViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaoRootViewController.h"
@class CleanDetailCheckViewModel;
@interface CleanDetailCheckTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RootViewControllerChangeSubVCDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) CleanDetailCheckViewModel *detailViewModel;
@end
