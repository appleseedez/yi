//
//  RegViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface RegViewModel : BaseViewModel
@property (nonatomic) NSNumber *messageSended; //bool 短信发送以后变yes
@property (nonatomic) NSNumber *regSuccess; //注册成功
@property (nonatomic) NSString *phone;
-(void)getCode:(NSString*)phone;
-(void)registerUserPassword:(NSString*)password code:(NSString*)code;
@end
