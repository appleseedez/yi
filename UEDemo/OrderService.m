//
//  OrderService.m
//  UEDemo
//
//  Created by nsc on 14-6-4.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "OrderService.h"

@implementation OrderService
static OrderService *instance=nil;
+(instancetype)defaultService{
    return instance;
}
+ (void)initialize
{
    if (self == [OrderService class]) {
        static BOOL didInit=NO;
        if (didInit==NO) {
            instance=[OrderService new];
            didInit=YES;
        }
    }
}
-(void)subCleanOrder:(Order*)order{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/loadHourlyWorkers.json",ACCOUNT_SERVER];
    [[self httpRequestWithURL:url andParameters:[order toDictionary] method:@"POST"] subscribeNext:^(id x) {
        
    }];
}

-(void)subWorkerOrder:(Order*)order{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createHourlyWorkerAppointment.json",ACCOUNT_SERVER];
    [[self httpRequestWithURL:url andParameters:[order toDictionary] method:@"POST"] subscribeNext:^(id x) {
        
    }];
}

-(void)subDryCleaningOrder:(Order*)order{
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createDryCleanAppointment.json",ACCOUNT_SERVER];
    [[self httpRequestWithURL:url andParameters:[order toDictionary] method:@"POST"] subscribeNext:^(id x) {
        
    }];
}
@end
