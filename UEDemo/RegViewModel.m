//
//  RegViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegViewModel.h"
#import "NSString+MD5.h"
#import "CustomAlertWindow.h"
@implementation RegViewModel
-(void)getCode:(NSString*)phone{
    
    __block NSString *selfPhone=[phone copy];
    NSString *url=[NSString stringWithFormat:@"%@/eclean/generateVerifyCode.json",ACCOUNT_SERVER];
    NSDictionary *parameters=@{@"phone":phone};
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"] subscribeNext:^(id x) {
        self.messageSended=@(YES);
        self.phone=selfPhone;
    }];
}
-(void)registerUserPassword:(NSString*)password code:(NSString*)code{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/registry.json",ACCOUNT_SERVER];
    NSDictionary *parameters=@{@"username":self.phone,@"password":[password md5],@"code":code};
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"] subscribeNext:^(id x) {
        self.regSuccess=@(YES);
//        [[[UIAlertView alloc]initWithTitle:@"恭喜注册成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        [CustomAlertWindow showWithText:@"恭喜注册成功"];
    }];
}
@end
