//
//  CleanServiceTableViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CleanViewModel;
@interface CleanServiceTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) CleanViewModel *cleanViewModel;
@end
