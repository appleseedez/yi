//
//  RegPasswordViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegPasswordViewController.h"
#import "RegViewModel.h"

@interface RegPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRePassword;

@end

@implementation RegPasswordViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    //监听HUD
    [[ RACObserve(self, regViewModel.busy) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText=@"请稍后";
            
        }else{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }
        
        
        return value;
    }]subscribeNext:^(id x) {}];
    
    [[ RACObserve(self, regViewModel.regSuccess) map:^id(NSNumber *value) {
        if ([value boolValue]) {
              [self.navigationController dismissViewControllerAnimated:YES completion:^{
                  
              }];
        }else{
           
        }
        
        
        return value;
    }]subscribeNext:^(id x) {}];
    
    
    // Do any additional setup after loading the view.
}
-(void)dismiss{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField==self.txtCode) {
        if (textField.text.length+string.length>6) {
            return NO;
        }
    }
    return YES;
}
- (IBAction)finishReg:(id)sender {
    if (![self.txtPassword.text isEqualToString:self.txtRePassword.text]) {
        [[[UIAlertView alloc]initWithTitle:@"两次输入密码不一致" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return;
    }
    if (self.txtCode.text.length==0) {
        [[[UIAlertView alloc]initWithTitle:@"请输入手机验证码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return;
    }
    if (self.txtPassword.text.length<6) {
        [[[UIAlertView alloc]initWithTitle:@"请输入至少大于6位的密码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return;
    }
    
    
    [self.regViewModel registerUserPassword:self.txtPassword.text code:self.txtCode.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
