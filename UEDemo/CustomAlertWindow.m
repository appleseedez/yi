//
//  CustomAlertWindow.m
//  UEDemo
//
//  Created by nsc on 14-6-11.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CustomAlertWindow.h"

@implementation CustomAlertWindow

- (instancetype)initWithText:(NSString*)text;
{
    self = [super init];
    if (self) {
        self.frame=[UIScreen mainScreen].bounds;
        self.windowLevel=UIWindowLevelAlert;
       
        UIImageView *imgMesBack=[[UIImageView alloc]init];
        imgMesBack.frame=CGRectMake(35, 180, 250, 180);
        imgMesBack.image=[UIImage imageNamed:@"custom_alert_back"];
        
        UIButton *cancel=[[UIButton alloc]init];
        cancel.frame=CGRectMake(320-14.5, 0, 14.5, 14.5);
        [cancel setImage:[UIImage imageNamed:@"custom_alert_cancel_btn"] forState:UIControlStateNormal];
        [cancel addTarget:self action:@selector(disappear) forControlEvents:UIControlEventTouchUpInside];
        [imgMesBack addSubview:cancel];
        [self addSubview:imgMesBack];
    }
    return self;
}
-(void)disappear{
    self.hidden=YES;
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
