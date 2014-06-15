//
//  MyCenterViewModel.h
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface MyCenterViewModel : BaseViewModel
@property (nonatomic) NSArray *myOrders;
@property (nonatomic) NSNumber *addressSetted;
-(void)modifyAddress:(NSString*)address;
-(void)refreshOrders;
@end
