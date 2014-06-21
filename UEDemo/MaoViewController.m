//
//  MaoViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoViewController.h"
#import "OrderPayViewController.h"
#import "AlixPayOrder.h"
#import "DataSigner.h"
#import "DataVerifier.h"
#import "AlixPayResult.h"
#import "CustomAlertWindow.h"
#define deltaY 20.0
@interface MaoViewController ()
@property(weak, nonatomic) IBOutlet UIButton *btnMain;
@property (weak, nonatomic) IBOutlet UIView *panView;

@end

@implementation MaoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    self.panView.center=CGPointMake(self.view.center.x, self.view.center.y-deltaY);
    
   
    
  // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)changeChild:(id)sender {
    int index=((UIView*)sender).tag-1000;
   
    [self.rootViewController changeSubVCWithIndex:index];
}


@end
