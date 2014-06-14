//
//  RegViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegViewController.h"
#import "LoginInputTextField.h"
#import "RegViewModel.h"
#import "CustomAlertWindow.h"
@interface RegViewController ()
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtCode;
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtPhone;
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtPassword;
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtRePassword;
@property (weak, nonatomic) IBOutlet UIButton *btnGet;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;

@end

@implementation RegViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeNormal);
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField==self.txtPhone) {
        if (textField.text.length+string.length>11) {
            return NO;
        }
    }else if (textField==self.txtCode){
        if (textField.text.length+string.length>4) {
            return NO;
        }
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeEdit);
}
- (IBAction)getCode:(id)sender {
    if (self.txtPhone.text.length>=11) {
         [self.regViewModel getCode:self.txtPhone.text];
    }else{
        [CustomAlertWindow showWithText:@"请输入正确的手机号码"];
    }
   
}
- (IBAction)registe:(id)sender {
    if (self.txtPassword.text.length<6) {
        [CustomAlertWindow showWithText:@"密码长度至少6位"];
        return;
    }
    if (![self.txtPassword.text isEqualToString:self.txtRePassword.text]) {
        [CustomAlertWindow showWithText:@"两次输入密码不一致"];
        return;
    }
    [self.regViewModel registerUserPassword:self.txtPassword.text code:self.txtCode.text];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    self.regViewModel=[[RegViewModel alloc]init];
    self.txtCode.userInteractionEnabled=NO;
    self.txtPassword.userInteractionEnabled=NO;
    self.txtRePassword.userInteractionEnabled=NO;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(conformKeyBoard:) name:UIKeyboardWillChangeFrameNotification object:Nil];
    //监听HUD
    [[ RACObserve(self, regViewModel.busy) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText = @"请稍后";
            
        } else {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
    [[RACObserve(self, regViewModel.messageSended) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            self.txtCode.userInteractionEnabled=YES;
            self.txtPassword.userInteractionEnabled=YES;
            self.txtRePassword.userInteractionEnabled=YES;
            [CustomAlertWindow showWithText:@"短信已经发送至您的手机\n请注意查收"];
        }
        
        return value;
    }] subscribeNext:^(id x) {}];
    
    [[RACObserve(self, regViewModel.regSuccess) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            
            [CustomAlertWindow showWithText:@"恭喜注册成功"];
        }
        
        return value;
    }] subscribeNext:^(id x) {}];
    
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)conformKeyBoard:(NSNotification*)notification{
    CGFloat keyBoardHeightDelta;
    
    NSDictionary *info= notification.userInfo;
    
    CGRect beginRect=[[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    keyBoardHeightDelta=beginRect.origin.y-endRect.origin.y;
    
    [UIView animateWithDuration:0.30 delay:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        if (keyBoardHeightDelta<0) {
            self.view.center=CGPointMake(self.view.center.x, self.view.center.y-keyBoardHeightDelta/2-40);
        }else{
             self.view.center=CGPointMake(self.view.center.x, self.view.center.y-keyBoardHeightDelta/2+40);
        }
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)setUI{
    [self.txtCode setUI];
    [self.txtPassword setUI];
    [self.txtRePassword setUI];
    [self.txtPhone setUI];
    self.btnGet.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnGet.layer.borderWidth=1.2;
    self.btnSub.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnSub.layer.borderWidth=1.2;
}



@end
