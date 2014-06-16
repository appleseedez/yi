//
//  DryCleaningViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"
@class DryCleaningService;
@interface DryCleaningViewModel : BaseViewModel
@property (nonatomic) NSArray *drySourceData;
@property (nonatomic,weak) DryCleaningService *service;
@property (nonatomic)  NSNumber *orderSuccess;
@property (nonatomic) NSNumber *allPrice;
-(void)subDryOrder;
@end
