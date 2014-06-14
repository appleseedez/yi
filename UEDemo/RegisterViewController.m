//
//  RegisterViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegViewModel.h"
#import "RegPasswordViewController.h"
#import "CustomAlertWindow.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;




@end

@implementation RegisterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.regViewModel =[[RegViewModel alloc]init];
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
   [[ RACObserve(self, regViewModel.messageSended) map:^id(NSNumber *value) {
       if ([value boolValue]) {
           
        RegPasswordViewController *passVC=   [self.storyboard instantiateViewControllerWithIdentifier:@"regPassword"];
           passVC.regViewModel=self.regViewModel;
           [self.navigationController pushViewController:passVC animated:YES];
        }else{
           
       }
       return value;
    }]subscribeNext:^(id x) {}];
    
    // Do any additional setup after loading the view.
}
- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)sendMessage:(id)sender {
    
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请输入正确的手机号码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    if (self.txtPhone.text.length!=11) {
       [CustomAlertWindow showWithText:@"请输入正确的手机号码"];
        return ;
    }
    NSRange range;
    range.length=1;
    range.location=0;
    NSString *first=[self.txtPhone.text substringWithRange:range];
    if ([first intValue]!=1) {
        [CustomAlertWindow showWithText:@"请输入正确的手机号码"];
        return;
    }
    [self.regViewModel getCode:self.txtPhone.text];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    
    if (textField.text.length+string.length>11) {
        return NO;
    }
    return YES;
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
