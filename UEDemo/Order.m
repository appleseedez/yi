//
//  Order.m
//  UEDemo
//
//  Created by nsc on 14-6-4.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "Order.h"
#import "MaoAppDelegate.h"
@implementation Order
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.storeid=self.currStore[@"id"];
        self.storename=self.currStore[@"name"];
        self.userid=self.hostUser[@"userid"];
        self.name=self.hostUser[@"nickname"];
        self.address=self.hostUser[@"address"];
        self.phone=self.hostUser[@"username"];
        self.source=@"IOS";
        self.allPrice=@(0);
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
-(NSDictionary*)currStore{
    if (_currStore==nil) {
        MaoAppDelegate *de=[UIApplication sharedApplication].delegate;
        _currStore=de.currStore;
    }
    return _currStore;
}
-(NSDictionary*)hostUser{
    if (_hostUser==nil) {
         MaoAppDelegate *de=[UIApplication sharedApplication].delegate;
        _hostUser=de.hostUser;
    }
    return _hostUser;
}
@end
