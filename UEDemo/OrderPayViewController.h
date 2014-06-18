//
//  OrderPayViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlixLibService.h"
@interface OrderPayViewController : UIViewController
@property (nonatomic) NSDictionary *order;
- (void)paymentResult:(NSString *)result;
@end
