//
//  MaoRootViewController.h
//  UEDemo
//
//  Created by nsc on 14-6-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RootViewControllerChangeSubVCDelegate <NSObject>

-(void)changeSubVCWithIndex:(NSInteger)index;
-(void)changeSubVCWithController:(UIViewController*)subVC;
-(void)changeRootVCWithController:(UIViewController*)subVC;
@end


@interface MaoRootViewController : UIViewController <RootViewControllerChangeSubVCDelegate>

@end
