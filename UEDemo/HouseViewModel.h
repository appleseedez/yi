//
//  HouseViewModel.h
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface HouseViewModel : BaseViewModel
@property (nonatomic) NSDictionary *store;
@property (nonatomic) NSArray *commets;
-(void)loadStore;
-(void)loadCommets;
@end
