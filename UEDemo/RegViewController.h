//
//  RegViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegViewModel;
@interface RegViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic) RegViewModel *regViewModel;
@end
