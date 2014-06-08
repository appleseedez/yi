//
//  CleanOrderSuccessViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-5.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanOrderSuccessViewController.h"
#import "MaoAppDelegate.h"
@interface CleanOrderSuccessViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbMes;

@end

@implementation CleanOrderSuccessViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSString *phone=[delegate.hostUser objectForKey:@"username"];
    self.lbMes.text=[NSString stringWithFormat:@"预约单已经发送\n稍后客服人员会通过\n%@\n联系您",phone];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    // Do any additional setup after loading the view.
}
-(void)dismiss{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
