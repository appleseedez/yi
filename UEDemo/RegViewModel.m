//
//  RegViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegViewModel.h"

@implementation RegViewModel
-(void)getCode:(NSString*)phone{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/generateVerifyCode.json",ACCOUNT_SERVER];
    NSDictionary *parameters=@{@"phone":phone};
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"] subscribeNext:^(id x) {
        self.messageSended=@(YES);
    }];
}
@end
