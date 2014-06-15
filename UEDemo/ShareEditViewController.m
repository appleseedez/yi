//
//  ShareEditViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "ShareEditViewController.h"
#import "LoginInputTextField.h"
#import "ShareService.h"
@interface ShareEditViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet LoginInputTextField *txtShareContent;

@end

@implementation ShareEditViewController
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeNormal);
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    LoginInputTextField *txt = (LoginInputTextField *)textField;
    txt.textType = @(loginTextTypeEdit);
}

- (IBAction)finish:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[ShareService defautService] shareWithTitle:@"容么么" content:self.txtShareContent.text type:self.shareType];
    }];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lbTitle.text=self.shareType;
    [self.txtShareContent setUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
