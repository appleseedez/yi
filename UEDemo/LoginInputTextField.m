//
//  LoginInputTextField.m
//  UEDemo
//
//  Created by nsc on 14-6-8.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "LoginInputTextField.h"

@implementation LoginInputTextField
/*
 make the textfield text and the placeholder text to have an inset.
 */
- (CGRect)textRectForBounds:(CGRect)bounds {
  return CGRectInset(bounds, 10, 0);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
  return CGRectInset(bounds, 10, 0);
}
- (void)setUI {
  UIColor *errorRed = [UIColor colorWithRed:230 / 255.0
                                      green:57 / 255.0
                                       blue:65 / 255.0
                                      alpha:1];
  UIColor *editGray = [UIColor colorWithRed:102 / 255.0
                                      green:102 / 255.0
                                       blue:102 / 255.0
                                      alpha:1];
  self.textType = @(loginTextTypeNormal);
  [self.layer setBorderWidth:0.3];
    __weak id weakSelf=self;
    [[RACObserve(self, textType) map:^id(NSNumber *value) {
        __strong LoginInputTextField *strongSelf=weakSelf;
      if ([value integerValue] == loginTextTypeNormal) {
        strongSelf.textColor = [UIColor whiteColor];
        strongSelf.backgroundColor = [UIColor clearColor];
        [strongSelf.layer
            setBorderColor:
                [UIColor colorWithPatternImage:[UIImage imageNamed:@"输入边框"]]
                    .CGColor];
        strongSelf.background = [UIImage imageNamed:@"透明输入框"];
      } else if ([value integerValue] == loginTextTypeError) {
        strongSelf.textColor = errorRed;
        [strongSelf.layer setBorderColor:errorRed.CGColor];
      } else if ([value integerValue] == loginTextTypeEdit) {
        strongSelf.textColor = editGray;
        strongSelf.placeHolder = @"";
        strongSelf.backgroundColor = [UIColor whiteColor];
      }

      return value;
    }]subscribeNext:^(id x) {}];

  
}

@end
