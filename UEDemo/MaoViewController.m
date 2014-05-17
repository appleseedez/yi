//
//  MaoViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoViewController.h"

@interface MaoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnMain;

@end

@implementation MaoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setButtonUI];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setButtonUI{
    [self.btnMain setClipsToBounds:YES];
    [self.btnMain.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnMain.layer setCornerRadius:self.btnMain.frame.size.height/2.0];
    [self.btnMain.layer setBorderWidth:20];
    
}

@end
