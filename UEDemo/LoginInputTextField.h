//
//  LoginInputTextField.h
//  UEDemo
//
//  Created by nsc on 14-6-8.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ENUM(NSInteger, loginTextType){
    loginTextTypeNormal,
    loginTextTypeEdit,
    loginTextTypeError
};
@interface LoginInputTextField : UITextField
@property  (nonatomic) NSNumber *textType;
@property  (nonatomic) NSString *placeHolder;

-(void)setUI;
@end
