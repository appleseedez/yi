//
//  WorkerListViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "WorkerListViewModel.h"
#import "TimeWorkerService.h"
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

@end
