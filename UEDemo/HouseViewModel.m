//
//  HouseViewModel.m
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "HouseViewModel.h"
#import "MaoAppDelegate.h"
@implementation HouseViewModel
-(void)loadStore{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/showOneStore.json",ACCOUNT_SERVER];
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    NSDictionary *currStore=delegate.currStore;
    if (!currStore) {
        return;
    }
    NSDictionary *parameters=@{@"storeid":[currStore objectForKey:@"id"]};
    [[self httpRequestWithURL:url andParameters:parameters method:@"get"]subscribeNext:^(id x) {
        self.store=x;
    }];
}
-(void)loadCommets{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/loadEvaluationsOfStore.json",ACCOUNT_SERVER];
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    NSDictionary *currStore=delegate.currStore;
    if (!currStore) {
        return;
    }
    NSDictionary *parameters=@{@"storeid":[currStore objectForKey:@"id"],@"start":@(0),@"limit":@(20)};
    [[self httpRequestWithURL:url andParameters:parameters method:@"get"]subscribeNext:^(id x) {
        self.commets=x;
    }];
}
@end
