//
//  MyCenterPersionalSettingController.h
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCenterViewModel;
#import "CustomAlertWindow.h"

@interface MyCenterPersionalSettingController : UIViewController <UITextFieldDelegate,CustomAlertWindowDelegate>
@property (nonatomic,weak) MyCenterViewModel *centerViewModel;
@end
