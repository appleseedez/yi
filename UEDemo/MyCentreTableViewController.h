//
//  MyCentreTableViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCenterViewModel;
@interface MyCentreTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property  (nonatomic) MyCenterViewModel *centerViewModel;
@end
