//
//  CleanDetailCheckViewModel.m
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanDetailCheckViewModel.h"
#import "CleanService.h"
#import "OrderSelection.h"
#import "CleanDetailCheckModel.h"
#import "Order.h"
#import "OrderSelection.h"
#import "CleanDetailCheckModel.h"
#import "CustomAlertWindow.h"
@implementation CleanDetailCheckViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cleanService=[CleanService defaultService];
        [ RACObserve(self, cleanService.serviceOrderSelections) subscribeNext:^(NSArray *value) {
           
            NSMutableArray *arr=[NSMutableArray new];
            if ([value count]) {
                for (OrderSelection *o in value) {
                    CleanDetailCheckModel *m=[CleanDetailCheckModel new];
                    m.selection=o;
                    m.choosed=@(NO);
                    [arr addObject:m];
                }
                self.detaileChecks=[arr copy];
            }}];
    }
    return self;
}
-(void)subDetailOrders{
    Order *o =[[Order alloc]init];
    
    o.servicetype=@"bj";
    NSMutableArray *services=[NSMutableArray new];
    for (CleanDetailCheckModel *dk in self.detaileChecks) {
        if ([dk.choosed boolValue]) {
              [services addObject:[dk.selection toDictionary]];
        }
      
    }
    if ([services count]==0) {
//        [[[UIAlertView alloc]initWithTitle:@"请选择服务项目" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        [CustomAlertWindow showWithText:@"请选择服务项目"];
        return;
    }
    o.services=[services copy];
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createCleanAppointment.json",ACCOUNT_SERVER];
    
    
    [[self httpRequestWithURL:url andParameters:[o toDictionary] method:@"post"] subscribeNext:^(id x) {
        self.orderSuccess=@(YES);
        self.orderSuccess=@(NO);
    }];
}

@end
