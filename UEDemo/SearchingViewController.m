//
//  SearchingViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "SearchingViewController.h"
#import "AppService.h"
@interface SearchingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnX;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;

@end

@implementation SearchingViewController


- (IBAction)dismiss:(id)sender {
    [AppService defaultService].showStoreSetting=@(NO);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.btnX.layer.borderWidth=2;
    self.btnX.layer.borderColor=[UIColor whiteColor].CGColor;
    self.imgLogo.animationImages=@[[UIImage imageNamed:@"search_animation1"],
                                   [UIImage imageNamed:@"search_animation8"],
                                   [UIImage imageNamed:@"search_animation7"],
                                   [UIImage imageNamed:@"search_animation6"],
                                   [UIImage imageNamed:@"search_animation5"],
                                   [UIImage imageNamed:@"search_animation4"],
                                   [UIImage imageNamed:@"search_animation3"],
                                   [UIImage imageNamed:@"search_animation2"],
                                   
                                   ];
    self.imgLogo.animationRepeatCount=0;
    self.imgLogo.animationDuration=0.5;
    [self.imgLogo startAnimating];
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
