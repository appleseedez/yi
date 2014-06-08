//
//  BaseViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.httpService=[HTTPService defaultService];
    }
    return self;
}
-(RACSignal*)httpRequestWithURL:(NSString*)url andParameters:(NSDictionary*)parameters method:(NSString*)method{
    RACSignal *signal=nil;
    RACSubject *response=[RACSubject subject];
    self.busy=@(YES);
  
        
    signal=[self.httpService jsonPostRequestWithUrl:url andParameters:parameters];
        
    
    [signal subscribeNext:^(NSDictionary *x) {
        if (![x isKindOfClass:[NSDictionary class]]) {
            [self responseError:x];
            return ;
        }
        id status=[x valueForKeyPath:@"head.status"];
        if (status) {
            if ([status intValue]==0) {
                
                [response sendNext:[x objectForKey:@"body"]];
              
            }else{
                [self responseFail:x];
            }
        }
        
    } error:^(NSError *error) {
        [response sendCompleted];
        self.busy=@(NO);
        [self requestError:error];
    } completed:^{
        [response sendCompleted];
        self.busy=@(NO);
    }];
    
    
    return response;
}
-(void)requestError:(NSError*)error{
    NSLog(@"请求错误:%@",error);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"网络异常" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
-(void)responseError:(NSDictionary*)response{
    NSLog(@"返回类型不是字典:%@",response);
    if ([response isKindOfClass:[NSData class]]) {
         NSString *s=[[NSString alloc]initWithData:(NSData*)response encoding:NSUTF8StringEncoding];
        NSLog(@"%@",s);
    }
   
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"服务器返回类型错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
-(void)responseFail:(NSDictionary*)response{
    NSString *status=[response valueForKeyPath:@"head.status"];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请求失败" message:[NSString stringWithFormat:@"异常类型:status=%@",status] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
@end
