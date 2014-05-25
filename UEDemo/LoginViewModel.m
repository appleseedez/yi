//
//  LoginViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "LoginViewModel.h"
#import "NSString+MD5.h"
#import "MaoAppDelegate.h"
@implementation LoginViewModel

-(void)login:(NSString*)user password:(NSString*)password{
    NSDictionary *parameters=@{@"phone":user,@"password":[password md5]};
    NSString *url=[NSString stringWithFormat:@"%@/eclean/login.json",ACCOUNT_SERVER];
    
    [[self  httpRequestWithURL:url andParameters:parameters method:@"post"]subscribeNext:^(NSDictionary *x) {
        if (x) {
            MaoAppDelegate *delegate=(MaoAppDelegate*)[UIApplication sharedApplication].delegate;
            delegate.hostUser=x;
            [[NSNotificationCenter defaultCenter]postNotificationName:@"loginSucces" object:nil];
        }
       
    }];
}

@end
