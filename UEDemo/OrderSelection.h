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

+(instancetype)selectionWithName:(NSString*)name price:(NSString*)price ID:(NSNumber*)ID suSelections:(NSArray*)subSelections;
@end
