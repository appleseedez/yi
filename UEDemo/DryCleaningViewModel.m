//
//  DryCleaningViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningViewModel.h"
#import "DryCleaningService.h"
#import "Order.h"
@implementation DryCleaningViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service=[DryCleaningService defaultService];
        [[RACObserve(self, service.clothesServices) map:^id(NSArray *value) {
            NSMutableArray *arr= [NSMutableArray new];
            for (NSDictionary *d in value) {
                NSMutableDictionary *dic=[d mutableCopy];
                [dic setObject:@(0) forKey:@"drynumber"];
                [dic setObject:@(0) forKey:@"ironingnumber"];
                [arr addObject:dic];
            }
            self.drySourceData=arr;
            return value;
        }]subscribeNext:^(id x) {}];
        [self.service loadServices];
        
    }
    

    return self;
}
-(void)subDryOrder{
    NSMutableArray *arr=[NSMutableArray new];
    for (NSDictionary *d in self.drySourceData) {
        int drynumber=[[d objectForKey:@"drynumber"]intValue];
        if (drynumber) {
            NSDictionary *item=@{@"itemid":[d objectForKey:@"id"],
                                 @"name":[d objectForKey:@"name"],
                                 @"amount":[d objectForKey:@"drynumber"],
                                @"price":[d objectForKey:@"dryprice"]};
            [arr addObject:item];
        }
    }
    if ([arr count]==0) {
        [[[UIAlertView alloc] initWithTitle:@"您还没有选择任何衣服" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return;
    }
    Order *o=[Order new];
    o.servicetype=@"gx";
    o.services=[arr copy];
    NSString *url=[NSString stringWithFormat:@"%@/eclean/createDryCleanAppointment.json",ACCOUNT_SERVER];
    NSDictionary *parameters=[o toDictionary];
    [[self httpRequestWithURL:url andParameters:parameters method:@"post"]subscribeNext:^(id x) {
        self.orderSuccess=@(YES);
        self.orderSuccess=@(NO);
    }];
}
@end
