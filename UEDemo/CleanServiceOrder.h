//
//  CleanServiceOrder.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//
/*
  服务订单
 
 */
#import <Foundation/Foundation.h>

@interface CleanServiceOrder : NSObject
@property  (nonatomic) NSArray *seletions; //订单内容
@property  (nonatomic) NSNumber *price; //订单价格
@end
