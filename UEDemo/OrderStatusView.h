//
//  OrderStatusView.h
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ENUM(NSInteger, statusViewType){
    statusViewTypeWaitingService=0,
    statusViewTypeInService=1,
    statusViewTypeWaitingPay=2,
    statusViewTypeFinish=3
};
@interface OrderStatusView : UIView

+(UIView *)viewWithStatusType:(NSInteger)statusViewType;
@end
