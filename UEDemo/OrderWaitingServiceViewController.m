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
#import "AlixLibService.h"
#import "MaoRootViewController.h"
#import "AlixPayResult.h"
#import "AlixPayOrder.h"
#import <UIImageView+AFNetworking.h>
#import "DataSigner.h"
#import "DataVerifier.h"
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
@property (weak, nonatomic) IBOutlet UIButton *btnPay;
@property (nonatomic) NSString *partnerID;
@property (nonatomic) NSString *sellerID;
@property (nonatomic) NSString *parterPrivateKey;
@property (nonatomic) NSString *aliPayPubKey;
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
    [self showEditView:@"微博"];

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
    vc.presetedNav=self.navigationController;
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
//        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_blank"] forState:UIControlStateNormal];
//        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_blank_high"] forState:UIControlStateHighlighted];
//        [self.rightBarButton setTitle:@"￥" forState:UIControlStateNormal];
//        [self.rightBarButton setTintColor:[UIColor whiteColor]];
        self.rightBarButton.alpha=0;
        self.btnPay.alpha=1;
    }else if (status==3){
        //评论
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_commit"] forState:UIControlStateNormal];
        [self.rightBarButton setBackgroundImage:[UIImage imageNamed:@"order_button_commit_high"] forState:UIControlStateHighlighted];
        [self.rightBarButton setTitle:@"" forState:UIControlStateNormal];
        self.btnPay.alpha=0;
        self.rightBarButton.alpha=1;
    }
}
-(void)loadData{
    NSInteger status=[[self.order objectForKey:@"status"] integerValue];
    NSString *statusLogoEndStr=nil;
     NSString *orderType=[self.order objectForKey:@"ordertype"];
    NSString *title=nil;
    if ([orderType isEqualToString:@"bj"]) {
        self.imgLogo.image=[UIImage imageNamed:@"order_logo_bj"];
        title=@"保洁订单";
    }else if ([orderType isEqualToString:@"gx"]){
        self.imgLogo.image=[UIImage imageNamed:@"order_logo_gx"];
        title=@"干洗订单";
    }else if ([orderType isEqualToString:@"zd"]){
        self.imgLogo.image=[UIImage imageNamed:@"order_logo_zd"];
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
- (IBAction)pay:(id)sender {
     [self getPayInfomation];
    if (!self.partnerID) {
        return;
    }
    if (!self.sellerID) {
        return;
    }
    if (!self.parterPrivateKey) {
        return;
    }
    if (!self.aliPayPubKey) {
        return;
    }
    if (!self.order) {
        return;
    }
    [self sendOrder];
}
- (NSString *)getOrderInfoFromProduct{
    NSString *ordername=nil;
    if ([[self.order objectForKey:@"ordertype"] isEqualToString:@"bj"]) {
        ordername=@"蓉么么保洁服务订单";
    }else if ([[self.order objectForKey:@"ordertype"] isEqualToString:@"gx"]){
        ordername=@"蓉么么干洗服务订单";
    }else if ([[self.order objectForKey:@"ordertype"] isEqualToString:@"zd"]){
        ordername=@"蓉么么钟点工服务订单";
    }
    
    
    
    AlixPayOrder *order = [[AlixPayOrder alloc] init];
    order.partner = self.partnerID;
    order.seller = self.sellerID;
    order.productName = ordername;
    order.productDescription = @"随便说说就好 这是文案";
    order.amount = [NSString stringWithFormat:@"%.2f", [[self.order objectForKey:@"allprice"] floatValue]];
    order.notifyURL = @"http%3A%2F%2F218.244.130.240:8080/eclean/alipay/noticeEcleanServer.do";
    order.tradeNO = [self.order objectForKey:@"orderno"];
    
    return order.description;
}
-(void)getPayInfomation{
    //这里需要做网络请求 如果请求到peiInfomation 结束流程 测试暂时写死
    self.partnerID=PartnerID;
    self.sellerID=SellerID;
    self.parterPrivateKey=PartnerPrivKey;
    self.aliPayPubKey=AlipayPubKey;
}
- (void)sendOrder{
    NSString *appScheme = @"rongmeme";
    NSString *orderInfo = [self getOrderInfoFromProduct];
    NSString *signedStr = [self doRsa:orderInfo];
    
    NSLog(@"%@", signedStr);
    
    NSString *orderString =
    [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"", orderInfo,
     signedStr, @"RSA"];
    
    [AlixLibService payOrder:orderString
                   AndScheme:appScheme
                     seletor:@selector(paymentResult:)
                      target:[UIApplication sharedApplication].delegate];
    
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (NSString *)doRsa:(NSString *)orderInfo {
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedString = [signer signString:orderInfo];
    return signedString;
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
