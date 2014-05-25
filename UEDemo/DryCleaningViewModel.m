//
//  DryCleaningViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningViewModel.h"
#import "DryCleaningService.h"
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
@end
