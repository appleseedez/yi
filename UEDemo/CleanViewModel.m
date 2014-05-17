//
//  CleanViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanViewModel.h"
#import "CleanSectionModel.h"
#import "CleanService.h"
@implementation CleanViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service=[CleanService defaultService];
        __weak id weakSelf=self;
         [RACObserve(self, service.serviceModels) subscribeNext:^(NSArray *x) {
            __strong CleanViewModel *strongSelf=weakSelf;
             NSMutableArray *arr=[NSMutableArray new];
             for (ServiceModel *model in x ) {
                 
                 CleanSectionModel *section=[CleanSectionModel SectionWithModel:model];
                 [arr addObject:section];
             }
             strongSelf.sections=[arr copy];
         }];
        
    }
    return self;
}
@end
