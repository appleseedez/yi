//
//  CleanServiceViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanServiceViewModel.h"
#import "Order.h"
#import "OrderSelection.h"
@implementation CleanServiceViewModel
+(instancetype)serviceViewModelWithModel:(ServiceModel*)model{
    CleanServiceViewModel *viewModel=[CleanServiceViewModel new];
    viewModel.selections = model.PackSelections;
    viewModel.title=model.title;
    return viewModel;
    
}
-(void)subOrders{
    Order *o =[[Order alloc]init];
    
    o.servicetype=@"bj";
    NSMutableArray *services=[NSMutableArray new];
    for (OrderSelection *os in self.selections) {
        
        [services addObject:[os toDictionary]];
    }
    o.services=[services copy];
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createCleanAppointment.json",ACCOUNT_SERVER];
    RACSubject *orderSuccess=nil;
    if (!self.orderSuccess) {
        orderSuccess=[RACSubject subject];
        self.orderSuccess =orderSuccess;
    }
    
    [[self httpRequestWithURL:url andParameters:[o toDictionary] method:@"post"] subscribeNext:^(id x) {
        [orderSuccess sendCompleted];
    }];
}
@end
