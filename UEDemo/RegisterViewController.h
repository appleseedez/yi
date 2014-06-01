//
//  RegisterViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegViewModel;
@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic) RegViewModel *regViewModel;
@end
