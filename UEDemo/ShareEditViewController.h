//
//  ShareEditViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class  ShareViewModel;
@interface ShareEditViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic) NSString *shareType;
@property (nonatomic) StarView *starView;
@property (nonatomic) ShareViewModel *shareViewModel;
@property (nonatomic) NSDictionary *order;
@property (nonatomic,weak) UINavigationController *presetedNav;
@end
