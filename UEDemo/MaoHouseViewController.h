//
//  MaoHouseViewController.h
//  UEDemo
//
//  Created by Zeug on 14-5-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HouseViewModel;
@interface MaoHouseViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
- (IBAction)dismissPage:(UIBarButtonItem *)cancel;
@property (nonatomic) HouseViewModel *houseViewModel;

@end
