//
//  CleanDetailCheckViewModel.h
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"
@class CleanService;
@interface CleanDetailCheckViewModel : BaseViewModel
@property  (nonatomic)  NSMutableArray *detaileChecks;
@property  (nonatomic,weak) CleanService *cleanService;
@end
