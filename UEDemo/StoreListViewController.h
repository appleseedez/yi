//
//  StoreListViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSArray *storeList;
@end
