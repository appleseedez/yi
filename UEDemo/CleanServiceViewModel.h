//
//  CleanServiceViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"
#import "ServiceModel.h"
@interface CleanServiceViewModel : BaseViewModel
+(instancetype)serviceViewModelWithModel:(ServiceModel*)model;
@property (nonatomic) NSNumber *orderSuccess;
-(void)subOrders;
@property (nonatomic) NSArray *selections;
@property (nonatomic) NSString *title;
@end
