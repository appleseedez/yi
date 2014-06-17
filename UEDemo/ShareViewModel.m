//
//  ShareViewModel.m
//  UEDemo
//
//  Created by nsc on 14-6-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "ShareViewModel.h"
#import "MaoAppDelegate.h"
@implementation ShareViewModel
-(void)subCommets:(NSNumber*)orderId commet:(NSString*)commet level:(NSNumber*)level{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/addEvaluation.json",ACCOUNT_SERVER];
    
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    NSNumber *userId=[delegate.hostUser objectForKey:@"userid"];
    
    NSDictionary *parameters=@{@"userid":userId,@"orderid":orderId,@"level":level,@"content":commet};
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"]subscribeNext:^(id x) {
        NSLog(@"评价提交成功");
    }];
    
}
@end
