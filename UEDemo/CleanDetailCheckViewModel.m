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
@implementation CleanDetailCheckViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cleanService=[CleanService defaultService];
        [[ RACObserve(self, cleanService.serviceOrderSelections) map:^id(NSArray *value) {
            self.detaileChecks=[NSMutableArray new];
            if ([value count]) {
                for (OrderSelection *o in value) {
                    CleanDetailCheckModel *m=[CleanDetailCheckModel new];
                    m.selection=o;
                    m.choosed=@(NO);
                    [self.detaileChecks addObject:m];
                }
            }
            
            
             return value;
         }]subscribeNext:^(id x) {}];
    }
    return self;
}
@end
