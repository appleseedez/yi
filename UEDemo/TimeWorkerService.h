//
//  TimeWorkerService.h
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface TimeWorkerService : BaseViewModel
+(instancetype)defaultService;
-(RACSignal*)loadWorkers;

@end
