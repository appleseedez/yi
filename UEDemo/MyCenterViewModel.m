//
//  MyCenterViewModel.m
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MyCenterViewModel.h"
#import "MaoAppDelegate.h"
#import "Order.h"
@implementation MyCenterViewModel
-(void)refreshOrders{
#if TEST
    NSDictionary *order1=@{@"id":@(1),
                           @"storeid":@(10),
                           @"storename":@"一个门店",
                           @"ordertype":@"bj",
                           @"allprice" :@(450),
                           @"status"   :@(0),
                           @"orderno"  :@"SF20140521-gx-1",
                           @"services" : @[]};
    NSDictionary *order2=@{@"id":@(1),
                           @"storeid":@(10),
                           @"storename":@"一个门店",
                           @"ordertype":@"zd",
                           @"allprice" :@(450),
                           @"status"   :@(1),
                           @"orderno"  :@"SF20140521-gx-1",
                           @"services" : @[]};
    NSDictionary *order3=@{@"id":@(1),
                           @"storeid":@(10),
                           @"storename":@"一个门店",
                           @"ordertype":@"gx",
                           @"allprice" :@(450),
                           @"status"   :@(2),
                           @"orderno"  :@"SF20140521-gx-1",
                           @"services" : @[]};
    NSDictionary *order4=@{@"id":@(1),
                           @"storeid":@(10),
                           @"storename":@"一个门店",
                           @"ordertype":@"bj",
                           @"allprice" :@(450),
                           @"status"   :@(3),
                           @"orderno"  :@"SF20140521-gx-1",
                           @"services" : @[]};
    self.myOrders=@[order1,order2,order3,order4];
    
#else
    
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    NSDictionary *hostUser=delegate.hostUser;
   // NSDictionary *currStore=delegate.currStore;
    
    NSDictionary *parameters=@{@"userid":[hostUser objectForKey:@"userid"],@"phone":[hostUser objectForKey:@"phone"]};
    NSString *url=[NSString stringWithFormat:@"%@/eclean/loadOrdersOfUser.json",ACCOUNT_SERVER];
    [[self httpRequestWithURL:url andParameters:parameters method:@"get"] subscribeNext:^(NSArray *x) {
        self.myOrders =x;
    }];
#endif
}
@end
