//
//  DryCleaningOrderViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DryCleaningViewModel;
@interface DryCleaningOrderViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) DryCleaningViewModel *dryViewModel;
@end
