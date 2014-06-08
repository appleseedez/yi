//
//  WorkerListViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "WorkerListViewModel.h"
#import "TimeWorkerService.h"
#import "Worker.h"
#import "Order.h"
@implementation WorkerListViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)loadWorkerList{
    RACSignal *RACworkerList=[[TimeWorkerService defaultService] loadWorkers];
       [[RACworkerList map:^id(NSArray *value) {
           self.workerList=value;
           return @(YES);
       }] subscribeNext:^(id x) {
           
       }];
}
-(void)subWorkerOrder{
    NSMutableArray *arr=[NSMutableArray new];
    for (Worker *w in self.workerList) {
        if ([w.selected boolValue]) {
            [arr addObject:[w toDictionary]];

        }
    }
    if ([arr count]==0) {
        [[[UIAlertView alloc]initWithTitle:@"您还没有选择为您服务的人员" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        return;
    }
    Order *o =[[Order alloc]init];
    o.servicetype=@"zd";
    o.services=[arr copy];
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createHourlyWorkerAppointment.json",ACCOUNT_SERVER];
    NSDictionary *parameters=[o toDictionary];
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"]subscribeNext:^(id x) {
        self.orderSuccess=@(YES);
        self.orderSuccess=@(NO);
    }];
    
}
@end
