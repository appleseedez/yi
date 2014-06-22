//
//  OrderWaitingServiceViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "OrderWaitingServiceViewController.h"
#import "MaoAppDelegate.h"
#import <UIImageView+AFNetworking.h>
#import "NSDictionary+killNull.h"
#import "ShareView.h"
#import "ShareEditViewController.h"
#import "ShareService.h"
#import "OrderPayViewController.h"
#import "MaoRootViewController.h"
#import <UIImageView+AFNetworking.h>
@interface OrderWaitingServiceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbOrderName;
@property (weak, nonatomic) IBOutlet UILabel *lbServiceTime;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UIView *serverListView;
@property (weak, nonatomic) IBOutlet UIButton *rightBarButton;
@property (weak, nonatomic) IBOutlet UILabel *lbAllPrice;
@property (nonatomic)   ShareView *shareView;
@end

@implementation OrderWaitingServiceViewController
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissShareView];
}
- (IBAction)pop:(id)sender {
    if (self.navigationController.childViewControllers[0]==self) {
        MaoRootViewController *roorVC=(MaoRootViewController*)[UIApplication sharedApplication].delegate.window.rootViewController;
        [roorVC changeRootVCWithController:self.navigationController];
        
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)shareWeixinPengyouquan:(id)sender {
    [self showEditView:@"微信朋友圈"];
}
- (IBAction)shareWeibo:(id)sender {
    [[ShareService defautService] shareWithTitle:@"蓉么么" content:@"" type:@"微博"];
}
- (IBAction)shareWeixinHaoyou:(id)sender {
     [self showEditView:@"微信好友"];
}
- (IBAction)shareMendian:(id)sender {
    [self showEditView:@"门店"];
}
-(void)showEditView:(NSString*)type{
    [self dismissShareView];
    ShareEditViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"shareEdit"];
    vc.shareType=type;
    vc.order=self.order;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}
- (IBAction)peyOrShare:(id)sender {
    NSInteger status=[[self.order objectForKey:@"status"] integerValue];
    if (status==3) {
        [self share];
    }else if (status<3){
        [self pay];
    }
    
}
-(void)pay{
   OrderPayViewController *payVC= [self.storyboard instantiateViewControllerWithIdentifier:@"orderPay"];
    payVC.order=self.order;
    [self.navigationController pushViewController:payVC animated:YES];
}
-(void)share{

    [self showShareView];
}
-(void)loadShareView{
   self.shareView=[[NSBundle mainBundle] loadNibNamed:@"ShareView" owner:self options:nil][0];
    NSLog(@"%@",self.shareView);
    self.shareView.frame=CGRectMake(0, self.view.bounds.size.height, self.shareView.frame.size.width, self.shareView.frame.size.height);
    [self.view addSubview:self.shareView];
}
-(void)showShareView{
    
    [UIView beginAnimations:@"" context:nil];
   
    
   self.shareView.frame=CGRectMake(0, self.view.bounds.size.height-self.shareView.bounds.size.height, self.shareView.frame.size.width, self.shareView.frame.size.height);
    [UIView commitAnimations];
}
-(IBAction)dismissShareView{
     [UIView beginAnimations:@"" context:nil];
   
   
    self.shareView.frame=CGRectMake(0, self.view.bounds.size.height, self.shareView.frame.size.width, self.shareView.frame.size.height);
    [UIView commitAnimations];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadShareView];
    [self loadData];
    [self setRightStatusButton];
    [self loadAllPrice];
    // Do any additional setup after loading the view.
}
-(void)loadAllPrice{
    NSNumber *price=[self.order objectForKey:@"allprice"];
    if ([price isEqual:[NSNull null]]&&![price isKindOfClass:[NSNumber class] ] ) {
        self.lbAllPrice.alpha=0;
    }else{
        self.lbAllPrice.text=[NSString stringWithFormat:@"￥  %.2f",[price floatValue]];
        self.lbAllPrice.alpha=1;
    }
}
-(void)setRightStatusButton{
     NSInteger status=[[self.order objectForKey:@"status"] integerValue];
    if (status<3) {
        //支付
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_blank"] forState:UIControlStateNormal];
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_blank_high"] forState:UIControlStateHighlighted];
        [self.rightBarButton setTitle:@"￥" forState:UIControlStateNormal];
        [self.rightBarButton setTintColor:[UIColor whiteColor]];
    }else if (status==3){
        //评论
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_commit"] forState:UIControlStateNormal];
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_commit_high"] forState:UIControlStateHighlighted];
        [self.rightBarButton setTitle:@"" forState:UIControlStateNormal];
    }
}
-(void)loadData{
    NSInteger status=[[self.order objectForKey:@"status"] integerValue];
    NSString *statusLogoEndStr=nil;
     NSString *orderType=[self.order objectForKey:@"ordertype"];
    NSString *title=nil;
    if ([orderType isEqualToString:@"bj"]) {
        
        title=@"保洁订单";
    }else if ([orderType isEqualToString:@"gx"]){
        title=@"干洗订单";
    }else if ([orderType isEqualToString:@"zd"]){
        title=@"钟点工订单";
    }
    switch (status) {
        case 0:
            
            statusLogoEndStr=@"未服务";
            break;
        case 1:
            
            statusLogoEndStr=@"未服务";
            break;
        case 2:
            
            statusLogoEndStr=@"服务中";
            break;
        case 3:
            
            statusLogoEndStr=@"已完成";
            break;
        case 4:
            
            statusLogoEndStr=@"已取消";
            break;
            
        default:
            break;
    }
    self.lbOrderName.text=[NSString stringWithFormat:@"%@%@",title,statusLogoEndStr];
    self.lbTitle.text=title;
    self.lbServiceTime.text=[self.order objectForKey:@"updatetime"];
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    self.lbAddress.text=[delegate.hostUser objectForKey:@"address"];
    self.lbPhone.text=[delegate.hostUser objectForKey:@"username"];
    NSArray *serverList=[self.order objectForKey:@"servers"];
    if ([serverList isKindOfClass:[NSArray class]]) {
        [self loadServers:serverList];
    }
    
}
-(void)loadServers:(NSArray*)serverList{
    
    float startX=30;
    float startY=40;
    float height=80;
    float width=60;
    float imgHeight=40;
    float imgwidth=40;
    for (int i=0;i<4;i++) {
       
        
        float x=width*(i%4) +startX;
        float y=height*(i/4)+startY;
        UIImageView *headerImage=[[UIImageView alloc]init];
        headerImage.frame=CGRectMake(x, y, imgwidth, imgHeight);
        headerImage.image=[UIImage imageNamed:@"header"];
      
        [headerImage.layer setCornerRadius:imgHeight/2.0];
        [headerImage setClipsToBounds:YES];
        [self.serverListView addSubview:headerImage];
        UILabel *lbname=[[UILabel alloc]init];
        
        [lbname setTextColor:[UIColor whiteColor]];
        lbname.frame=CGRectMake(x+5, y+imgHeight+10, imgwidth+20, 15);
        [lbname setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
        //[lbname setTextAlignment:NSTextAlignmentCenter];
        
        
        
        [self.serverListView addSubview:lbname];
        if (i+1>[serverList count]) {
                lbname.text=@"暂无";
            headerImage.image=[UIImage imageNamed:@"center_order_nobody"];
        }else{
            NSDictionary *worker=[[serverList objectAtIndex:i ] killNull];
            lbname.text=[worker objectForKey:@"name"];
            NSString *imgUrl=[worker objectForKey:@"avatar"];
            [headerImage setImageWithURL:[NSURL URLWithString:imgUrl]];
        }
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
