//
//  OrderSelection.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//
/*
   订单选项
 
 */
#import <Foundation/Foundation.h>

@interface OrderSelection : NSObject
@property (nonatomic) NSString *name; // 选项名称
@property (nonatomic) NSString *price; // 选项单价
@property (nonatomic) NSNumber *ID;    //选项唯一标识
@property (nonatomic) NSArray *subSelections; // 包含的服务项目 (子选项 可以没有)
@property (nonatomic) NSNumber *choosed; //用户选中了
+(instancetype)selectionWithName:(NSString*)name price:(NSString*)price ID:(NSNumber*)ID suSelections:(NSArray*)subSelections;
@end
