//
//  CleanServiceTableViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CleanViewModel;
@protocol CleanCellPushDelegate ;
@interface CleanServiceTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,CleanCellPushDelegate>
@property (nonatomic) CleanViewModel *cleanViewModel;
@end
