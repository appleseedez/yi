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
        //self.backgroundColor=[UIColor grayColor];
        UIImageView *imgMesBack=[[UIImageView alloc]init];
        imgMesBack.frame=CGRectMake(35, 180, 250, 180);
        imgMesBack.image=[UIImage imageNamed:@"custom_alert_back"];
        
        UIButton *cancel=[[UIButton alloc]init];
        cancel.frame=CGRectMake(250-40, 0, 40, 40);
        [cancel setImage:[UIImage imageNamed:@"custom_alert_cancel_btn"] forState:UIControlStateNormal];
        [cancel addTarget:self action:@selector(disappear) forControlEvents:UIControlEventTouchUpInside];
        cancel.backgroundColor=[UIColor clearColor];
        [imgMesBack addSubview:cancel];
        imgMesBack.userInteractionEnabled=YES;
        UILabel *textLabel=[[UILabel alloc]init];
        textLabel.frame=imgMesBack.bounds;
        textLabel.textColor=[UIColor whiteColor];
        textLabel.text=text;
        [textLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:16]];
        [textLabel setTextAlignment:NSTextAlignmentCenter];
        textLabel.numberOfLines=0;
        textLabel.backgroundColor=[UIColor clearColor];
        [imgMesBack addSubview:textLabel];
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
