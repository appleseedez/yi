//
//  CleanService.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceModel.h"
@interface CleanService : NSObject
+(instancetype)defaultService;
/*
  清洁服务包含的服务选项
 */
@property (nonatomic) NSArray *serviceModels;
/*
   从服务器加载这些选项
 */
-(void) loadServiceModels;
@end
