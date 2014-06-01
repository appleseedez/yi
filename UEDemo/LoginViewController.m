//
//  LoginViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation LoginViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)login:(id)sender {
    [self.loginViewModel login:self.txtPhone.text password:self.txtPassword.text];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginViewModel =[[LoginViewModel alloc]init];
    //监听HUD
   [[ RACObserve(self, loginViewModel.busy) map:^id(NSNumber *value) {
       if ([value boolValue]) {
           MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
           hud.labelText=@"请稍后";
         
       }else{
           [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
       }
       
       
       return value;
    }]subscribeNext:^(id x) {}];
    // Do any additional setup after loading the view.
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
