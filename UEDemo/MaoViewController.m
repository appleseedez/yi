//
//  MaoViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoViewController.h"
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



@end
