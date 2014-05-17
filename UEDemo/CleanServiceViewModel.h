//
//  CleanServiceViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceModel.h"
@interface CleanServiceViewModel : NSObject
+(instancetype)serviceViewModelWithModel:(ServiceModel*)model;
@property (nonatomic) NSArray *selections;
@property (nonatomic) NSString *title;
@end
