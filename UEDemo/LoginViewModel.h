//
//  LoginViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoginViewModel : BaseViewModel
-(void)login:(NSString*)user password:(NSString*)password;
@end
