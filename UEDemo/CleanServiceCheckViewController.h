//
//  CleanServiceCheckViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CleanServiceViewModel.h"
@interface CleanServiceCheckViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) CleanServiceViewModel *serviceViewModel;
@end
