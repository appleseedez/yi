//
//  OrderService.h
//  UEDemo
//
//  Created by nsc on 14-6-4.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"
#import "Order.h"
@interface OrderService : BaseViewModel

+(instancetype)defaultService;
-(void)subCleanOrder:(Order*)order;
-(void)subWorkerOrder:(Order*)order;
-(void)subDryCleaningOrder:(Order*)order;
@end
