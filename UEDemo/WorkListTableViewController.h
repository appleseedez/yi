//
//  WorkListTableViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WorkerListViewModel;
@interface WorkListTableViewController : UITableViewController

@property  (nonatomic) WorkerListViewModel *listViewModel;
@end
