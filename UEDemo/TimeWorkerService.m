//
//  TimeWorkerService.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "TimeWorkerService.h"
#import "Worker.h"
static TimeWorkerService *instance;
@implementation TimeWorkerService
+(instancetype)defaultService{
    return instance;
}
+ (void)initialize
{
    if (self == [TimeWorkerService class]) {
      static  BOOL didInit=NO;
        if (didInit==NO) {
            instance=[[[self class] alloc]init];
        }
    }
}
-(RACSignal*)loadWorkers{
    
#if TEST
    RACSignal *signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        Worker *worker1=[Worker new];
        worker1.name=@"张无忌";
        worker1.skills=@[@"打水",@"擦地",@"煮饭",@"刷碗"];
        worker1.prices=@"￥ 30~50";
        
        Worker *worker2=[Worker new];
        worker2.name=@"赵敏";
        worker2.skills=@[@"买菜",@"做饭",@"看孩子"];
        worker2.prices=@"￥ 30~50";
        
        Worker *worker3=[Worker new];
        worker3.name=@"周芷若";
        worker3.skills=@[@"按摩",@"暖床",@"洗脚",@"喂饭"];
        worker3.prices=@"￥ 348~688";
        
        Worker *worker4=[Worker new];
        worker4.name=@"陈浩南";
        worker4.skills=@[@"打架",@"讨债",@"保镖",@"痛扁产品经理"];
        worker4.prices=@"￥ 211~348";
        
        Worker *worker5=[Worker new];
        worker5.name=@"欧阳克";
        worker5.skills=@[@"培训泡妞",@"代写情书",@"搞定前女友",@"威胁丈母娘"];
        worker5.prices=@"￥ 248~576";
        NSArray *arr=@[worker1,worker2,worker3,worker4,worker5];
        
        [subscriber sendNext:arr];
        
        [subscriber sendCompleted];
        return nil;
    }];
#endif
    return signal;
}
@end
