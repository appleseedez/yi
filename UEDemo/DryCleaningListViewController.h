//
//  DryCleaningListViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DryCleaningViewModel;
@interface DryCleaningListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic)  DryCleaningViewModel *dryViewModel;
@end
