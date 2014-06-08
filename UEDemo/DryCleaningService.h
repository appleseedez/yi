//
//  DryCleaningService.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface DryCleaningService : BaseViewModel
+(instancetype)defaultService;
@property (nonatomic) NSArray *clothesServices;
-(void)loadServices;
@end
