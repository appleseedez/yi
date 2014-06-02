//
//  CleanDetailCheckModel.h
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderSelection;
@interface CleanDetailCheckModel : NSObject
@property (nonatomic) NSNumber *choosed;
@property (nonatomic) OrderSelection *selection;
@end
