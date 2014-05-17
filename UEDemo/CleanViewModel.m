//
//  CleanViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanViewModel.h"
#import "CleanSectionModel.h"
@implementation CleanViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sections=[NSMutableArray new];
        for (int i=1; i<=5; i++) {
            CleanSectionModel *model=[CleanSectionModel loadWith:i];
            [self.sections addObject:model];
            }
       
    }
    return self;
}
@end
