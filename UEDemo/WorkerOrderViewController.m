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
@interface WorkerOrderViewController ()
@property (weak, nonatomic) IBOutlet UIView *selectedWorkerView;

@end

@implementation WorkerOrderViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSelectedWorkerView];
    
    [[RACObserve(self, listViewModel.orderSuccess) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanOrderSuccess"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
    
}
- (IBAction)subWorkerOrder:(id)sender {
    [self.listViewModel subWorkerOrder];
}
-(void)loadSelectedWorkerView{
    NSMutableArray *selected=[NSMutableArray new];
    for (Worker *worker in self.listViewModel.workerList) {
        if ([worker.selected boolValue]) {
            [selected addObject:worker];
        }
    }
    float startX=10;
    float startY=10;
    float height=60;
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
        [self.selectedWorkerView addSubview:headerImage];
        UILabel *lbname=[[UILabel alloc]init];
        lbname.text=worker.name;
        lbname.frame=CGRectMake(x, y+imgHeight, imgwidth, 15);
        [lbname setTextColor:[UIColor blackColor]];
        [lbname setFont:[UIFont fontWithName:@"HeiTi SC" size:11]];
        [lbname setTextAlignment:NSTextAlignmentCenter];
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

@end
