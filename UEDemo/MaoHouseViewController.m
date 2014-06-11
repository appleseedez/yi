//
//  MaoHouseViewController.m
//  UEDemo
//
//  Created by Zeug on 14-5-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoHouseViewController.h"
#import "AppService.h"
@interface MaoHouseViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnScan;
@property (weak, nonatomic) IBOutlet UIButton *btnCall;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@end

@implementation MaoHouseViewController
- (void)dismissPage:(UIBarButtonItem *)cancel {
  [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.btnBack addTarget:self action:@selector(dismissPage:) forControlEvents:UIControlEventTouchUpInside];
    [self setUI];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
    [self becomeFirstResponder];
}
-(void)setUI{
    self.btnBack.clipsToBounds=YES;
    [self.btnBack.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.btnBack.layer setBorderWidth:1];
    [self.btnBack.layer setCornerRadius:5];
    
    self.btnCall.clipsToBounds=YES;
    [self.btnCall.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.btnCall.layer setBorderWidth:1];
    [self.btnCall.layer setCornerRadius:5];
    
    self.btnScan.clipsToBounds=YES;
    [self.btnScan.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.btnScan.layer setBorderWidth:1];
    [self.btnScan.layer setCornerRadius:5];
}
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"有媳妇的都抱稳了 我要开始摇了！！！");
    
}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"我勒个去 没摇出来 进入要饭模式！！！");
    //摇动取消
    
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动结束
     NSLog(@"摇出来了！！！进入装B模式！！！");
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        [AppService defaultService].showStoreSetting=@(YES);
        //[[AppService defaultService]getLocation];
        
    }
    
}
@end
