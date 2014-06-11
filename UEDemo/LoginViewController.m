//
//  LoginViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "LoginInputTextField.h"

@interface LoginViewController ()
@property(weak, nonatomic) IBOutlet LoginInputTextField *txtPhone;
@property(weak, nonatomic) IBOutlet LoginInputTextField *txtPassword;
@property(nonatomic, weak) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController
- (BOOL)textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string {

  if (textField == self.txtPhone) {

    if (textField.text.length + string.length > 11) {
      return NO;
    }
  }
  return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {

  LoginInputTextField *txt = (LoginInputTextField *)textField;
  txt.textType = @(loginTextTypeNormal);
  //    if (txt.text.length==0) {
  //        if (textField==self.txtPassword) {
  //            self.txtPassword.secureTextEntry=NO;
  //        }
  //        txt.text=txt.placeHolder;
  //    }
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
  LoginInputTextField *txt = (LoginInputTextField *)textField;
  txt.textType = @(loginTextTypeEdit);
  //    if (textField==self.txtPassword) {
  //
  //        self.txtPassword.secureTextEntry=YES;
  //    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.view endEditing:YES];
}
- (IBAction)login:(id)sender {
  if ([self.txtPhone.text isEqualToString:self.txtPhone.placeHolder] ||
      self.txtPhone.text.length == 0) {
    [[[UIAlertView alloc] initWithTitle:@"用户名不能为空"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil] show];
    return;
  }
  if ([self.txtPassword.text isEqualToString:self.txtPassword.placeHolder] ||
      self.txtPassword.text.length == 0) {
    [[[UIAlertView alloc] initWithTitle:@"密码不能为空"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil] show];

    return;
  }

  [self.loginViewModel login:self.txtPhone.text password:self.txtPassword.text];
}
- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
    self.txtPassword.text=@"123456";
    self.txtPhone.text=@"132321245213";
  self.loginViewModel = [[LoginViewModel alloc] init];
  //监听HUD
   [[ RACObserve(self, loginViewModel.busy) map:^id(NSNumber *value) {
     if ([value boolValue]) {
       MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
       hud.labelText = @"请稍后";

     } else {
       [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
     }

     return value;
   }]subscribeNext:^(id x) {}];
   // Do any additional setup after loading the view.
}
- (void)setUI {
  [self.txtPhone setUI];
  [self.txtPassword setUI];
  self.loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
  self.loginButton.layer.borderWidth = 1.0f;
  self.loginButton.layer.masksToBounds = YES;
  //  self.txtPhone.placeHolder = @"请输入您注册的手机号码";
  //  self.txtPassword.placeHolder = @"请输入登陆密码";
  //  self.txtPassword.secureTextEntry = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
