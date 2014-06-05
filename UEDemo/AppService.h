//
//  AppService.h
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HostInfomation.h"
#import "BaseViewModel.h"
@interface AppService : BaseViewModel
+(instancetype)defaultService;
@property (nonatomic) HostInfomation *hostInfomation;
-(void)getStore;
@end
