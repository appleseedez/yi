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
#import "StarView.h"
#import "ShareViewModel.h"
@interface ShareEditViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIView *shareView;
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)finish:(id)sender {
    [self.shareViewModel subCommets:[self.order objectForKey:@"id"] commet:self.txtShareContent.text level:@([self.starView.score intValue]+1)];
    [self dismissViewControllerAnimated:YES completion:^{
        if ([self.shareType isEqualToString:@"微信朋友圈"]) {
             [[ShareService defautService] shareWithTitle:@"蓉么么" content:self.txtShareContent.text type:self.shareType];
        }
       
    }];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shareViewModel=[[ShareViewModel alloc]init];
    self.lbTitle.text=self.shareType;
    [self.txtShareContent setUI];
    self.starView=[[StarView alloc]initWithFrame:CGRectMake(60, 0, 230, 40)];
    [self.starView loadStars:25];
    [self.shareView addSubview:self.starView];
    [self.starView setNewScore:4];
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
