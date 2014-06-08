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

    [[RACObserve(self, textType) map:^id(NSNumber *value) {

      if ([value integerValue] == loginTextTypeNormal) {
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
        [self.layer
            setBorderColor:
                [UIColor colorWithPatternImage:[UIImage imageNamed:@"输入边框"]]
                    .CGColor];
        self.background = [UIImage imageNamed:@"透明输入框"];
      } else if ([value integerValue] == loginTextTypeError) {
        self.textColor = errorRed;
        [self.layer setBorderColor:errorRed.CGColor];
      } else if ([value integerValue] == loginTextTypeEdit) {
        self.textColor = editGray;
        self.placeHolder = @"";
        self.backgroundColor = [UIColor whiteColor];
      }

      return value;
    }]subscribeNext:^(id x) {}];

    [[RACObserve(self, text) map:^id(NSString *value) {
      //      if (value.length == 0 && self.isFirstResponder == NO) {
      //        [self performSelector:@selector(setText:)
      //                   withObject:self.placeHolder
      //                   afterDelay:0];
      //      } else {
      //      }

      return value;
    }]subscribeNext:^(id x) {}];
  
}

@end
