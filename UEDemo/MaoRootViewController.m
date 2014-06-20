//
//  MaoRootViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoRootViewController.h"
#import "MaoViewController.h"
#import "AppService.h"
#import "MaoHouseViewController.h"
@interface MaoRootViewController ()

@end
static bool supportShake=NO;
static UIViewController *currViewController=nil;
@implementation MaoRootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadSubNavs];
    MaoViewController *maoVC=(MaoViewController*)[self.childViewControllers objectAtIndex:5];
    maoVC.rootViewController=self;
    [self.view addSubview:maoVC.view];
    currViewController=maoVC;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showOrder:) name:@"showOrder" object:nil];
    supportShake=YES;
    // Do any additional setup after loading the view.
}

-(void)loadSubNavs{
    NSArray *storyboardIDs=@[@"bjnav",@"zdnav",@"gxnav",@"ddnav",@"zynav",@"home"];
    
    for (NSString *storyID in storyboardIDs) {
        UIViewController *subController=[self.storyboard instantiateViewControllerWithIdentifier:storyID];
        [self addChildViewController:subController];
    }
}
-(void)showOrder:(NSNotification*)notification{
    UIViewController *vc=(UIViewController*)notification.object;
    [self addChildViewController:vc];
    [self changeToChildController:vc];
}
-(void)dismissOrder:(NSNotification*)notification{
    [self changeRootVCWithController:[self.childViewControllers lastObject]];
    [[self.childViewControllers lastObject] removeFromParentViewController];
}
-(void)changeToChildController:(UIViewController*)subController{
    
    supportShake=NO;
    
    [self transitionFromViewController:currViewController toViewController:subController duration:0.3 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
    
} completion:^(BOOL finished) {
   
}];
    currViewController=subController;
}
-(void)backToRoot:(UIViewController*)subController{
    supportShake=YES;
    
    [self transitionFromViewController:currViewController toViewController:[self.childViewControllers objectAtIndex:5] duration:0.3 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    currViewController=[self.childViewControllers objectAtIndex:5];
}

-(void)changeSubVCWithIndex:(NSInteger)index{
   
    UIViewController *subVC=  [self.childViewControllers objectAtIndex:index];
    [self changeToChildController:subVC];
}
-(void)changeSubVCWithController:(UIViewController*)subVC{
    [self changeToChildController:subVC];
}
-(void)changeRootVCWithController:(UIViewController*)subVC{
    [self backToRoot:subVC];
}
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"有媳妇的都抱稳了 我要开始摇了！！！");
    
}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"我勒个去 没摇出来 进入要饭模式！！！");
    //摇动取消
    
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    if (!supportShake) {
        NSLog(@"不是主页 摇出来也白摇！！！");
        return;
    }
    //摇动结束
    NSLog(@"摇出来了！！！进入装B模式！！！");
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        [AppService defaultService].showStoreSetting=@(YES);
        //[[AppService defaultService]getLocation];
        
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
