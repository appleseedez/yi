//
//  Order.m
//  UEDemo
//
//  Created by nsc on 14-6-4.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "Order.h"

@implementation Order
- (instancetype)init
{
    self = [super init];
    if (self) {
        MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
        self.hostUser=delegate.hostUser;
        self.currStore=delegate.currStore;
        
        self.storeid=self.currStore[@"id"];
        self.storename=self.currStore[@"name"];
        self.userid=self.hostUser[@"userid"];
        self.name=self.hostUser[@"nickname"];
        self.address=self.hostUser[@"address"];
        self.phone=self.hostUser[@"phone"];
        self.source=@"IOS";
    }
    return self;
}
-(NSDictionary*)toDictionary{
    self.allPrice=@(0);
    NSDictionary *dic=@{@"servicetype" :@"bj" ,
                        @"storeid":self.storeid,
                        @"storename":self.storename,
                        @"allprice":self.allPrice,
                        @"userid":  self.userid,
                        @"name"  :  self.name,
                        @"phone" :  self.phone,
                        @"address": self.address,
                        @"services":self.services};
    
    return dic;
}
@end
