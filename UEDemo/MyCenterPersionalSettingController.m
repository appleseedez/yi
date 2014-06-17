//
//  MyCenterPersionalSettingController.m
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MyCenterPersionalSettingController.h"
#import "LoginInputTextField.h"
#import "MyCenterViewModel.h"
#import "CustomAlertWindow.h"


@interface MyCenterPersionalSettingController ()
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtAddress;

@end

@implementation MyCenterPersionalSettingController

- (IBAction)pop:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)setAddress:(id)sender {
    if (self.txtAddress.text.length==0) {
        [CustomAlertWindow showWithText:@"请输入您的地址"];
        return;
    }
    [self.centerViewModel modifyAddress:self.txtAddress.text];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeNormal);
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeEdit);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.txtAddress setUI];
    
    __weak id weakSelf=self;
    //监听HUD
    [[ RACObserve(self, centerViewModel.busy) map:^id(NSNumber *value) {
        __strong MyCenterPersionalSettingController *strongSelf=weakSelf;
        if ([value boolValue]) {
            MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:strongSelf.view animated:YES];
            hud.labelText = @"请稍后";
            
        } else {
            [MBProgressHUD hideAllHUDsForView:strongSelf.view animated:YES];
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
    
    [[ RACObserve(self, centerViewModel.addressSetted) map:^id(NSNumber *value) {
        __strong MyCenterPersionalSettingController *strongSelf=weakSelf;
        if ([value boolValue]) {
         CustomAlertWindow *alert = [CustomAlertWindow showWithText:@"新地址设置成功"];
            alert.cdelegate=strongSelf;
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
  
}
-(void)alertDidDisappear{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)dealloc{
    NSLog(@"%@ dealloc",self);
}

@end
