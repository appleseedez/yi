//
//  MaoViewController.h
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaoRootViewController.h"
@interface MaoViewController : UIViewController
@property (nonatomic,weak) id  <RootViewControllerChangeSubVCDelegate > rootViewController;
@end
