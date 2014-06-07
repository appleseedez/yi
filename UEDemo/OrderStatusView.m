//
//  OrderStatusView.m
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "OrderStatusView.h"

@implementation OrderStatusView

+(UIView *)viewWithStatusType:(NSInteger)statusViewType{
    NSArray *a=[[NSBundle mainBundle] loadNibNamed:@"statusView" owner:nil options:nil];
    OrderStatusView *view=[a objectAtIndex:statusViewType];
    return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
