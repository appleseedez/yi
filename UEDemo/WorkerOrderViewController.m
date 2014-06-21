//
//  WorkerOrderViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "WorkerOrderViewController.h"
#import "WorkerListViewModel.h"
#import "Worker.h"
#import "CustomAlertWindow.h"
#import "MaoAppDelegate.h"
@interface WorkerOrderViewController ()
@property (weak, nonatomic) IBOutlet UIView *selectedWorkerView;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;


@end

@implementation WorkerOrderViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSelectedWorkerView];
    __weak id  weakSelf=self;
    [[RACObserve(self, listViewModel.orderSuccess) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
            NSString *userphone=[delegate.hostUser objectForKey:@"username"];
            
             NSString *message=[NSString stringWithFormat:@"预约订单已经发送\n稍后客服人员会通过\n%@\n联系您",userphone];
           CustomAlertWindow *alert= [CustomAlertWindow showWithText:message];
            alert.cdelegate=weakSelf;
                               }
        
        return value;
    }]subscribeNext:^(id x) {}];
    
}
-(void)alertDidDisappear{
    MaoRootViewController *rooVC=(MaoRootViewController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    [self.navigationController popToRootViewControllerAnimated:NO];
    [rooVC changeRootVCWithController:self.navigationController];
}
- (IBAction)subWorkerOrder:(id)sender {
    [self.listViewModel subWorkerOrder];
}
- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadSelectedWorkerView{
    NSMutableArray *selected=[NSMutableArray new];
    for (Worker *worker in self.listViewModel.workerList) {
        if ([worker.selected boolValue]) {
            [selected addObject:worker];
        }
    }
    float startX=30;
    float startY=10;
    float height=80;
    float width=60;
    float imgHeight=40;
    float imgwidth=40;
    for (Worker *worker in selected) {
        NSUInteger i=[selected indexOfObject:worker];
        float x=width*(i%4) +startX;
        float y=height*(i/4)+startY;
        UIImageView *headerImage=[[UIImageView alloc]init];
        headerImage.frame=CGRectMake(x, y, imgwidth, imgHeight);
        headerImage.image=[UIImage imageNamed:@"header"];
        [headerImage.layer setCornerRadius:imgHeight/2.0];
        [headerImage setClipsToBounds:YES];
        [self.selectedWorkerView addSubview:headerImage];
        UILabel *lbname=[[UILabel alloc]init];
        lbname.text=worker.name;
        [lbname setTextColor:[UIColor whiteColor]];
        lbname.frame=CGRectMake(x, y+imgHeight+10, imgwidth+20, 15);
        [lbname setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
        
        //[lbname setTextColor:[UIColor blackColor]];
        //[lbname setFont:[UIFont fontWithName:@"HeiTi SC" size:11]];
        //[lbname setTextAlignment:NSTextAlignmentCenter];
        [self.selectedWorkerView addSubview:lbname];
        
    }
    
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
-(void)dealloc{
    NSLog(@"%@ dealloc",self);
}
@end
