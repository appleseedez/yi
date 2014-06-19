//
//  CleanViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"
@class CleanService;
@interface CleanViewModel : BaseViewModel
@property (nonatomic,strong) NSArray *sections;
@property (nonatomic,weak)   CleanService *service;
@end
