//
//  CustomAlertWindow.h
//  UEDemo
//
//  Created by nsc on 14-6-11.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertWindow : UIWindow
+(instancetype)showWithText:(NSString*)text;
- (instancetype)initWithText:(NSString*)text;
@property (nonatomic) UILabel *textLabel;
@end
