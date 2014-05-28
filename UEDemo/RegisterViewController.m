//
//  RegisterViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegViewModel.h"
@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet UIButton *btnSendMes;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end

@implementation RegisterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
   [[ RACObserve(self, regViewModel.messageSended) map:^id(NSNumber *value) {
       if ([value boolValue]) {
           self.btnNext.enabled=YES;
           self.txtCode.enabled=YES;
       }else{
           self.btnNext.enabled=NO;
           self.txtCode.enabled=NO;
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
