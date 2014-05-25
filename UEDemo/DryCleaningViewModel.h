//
//  DryCleaningViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DryCleaningService;
@interface DryCleaningViewModel : NSObject
@property (nonatomic) NSArray *drySourceData;
@property (nonatomic,weak) DryCleaningService *service;
@end
