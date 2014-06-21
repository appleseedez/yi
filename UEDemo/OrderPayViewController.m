//
//  OrderPayViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "OrderPayViewController.h"
#import "AlixPayOrder.h"
#import "DataSigner.h"
#import "DataVerifier.h"
#import "AlixPayResult.h"
#import "CustomAlertWindow.h"
#import "MaoAppDelegate.h"
@interface OrderPayViewController ()
@property (nonatomic) NSString *partnerID;
@property (nonatomic) NSString *sellerID;
@property (nonatomic) NSString *parterPrivateKey;
@property (nonatomic) NSString *aliPayPubKey;
@property (weak, nonatomic) IBOutlet UILabel *lbServiceTime;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;


@end

@implementation OrderPayViewController


- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getPayInfomation];
    [self loadData];
    
    
}
-(void)loadData{
  
    
   
    self.lbServiceTime.text=[self.order objectForKey:@"updatetime"];
    MaoAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    self.lbAddress.text=[delegate.hostUser objectForKey:@"address"];
    self.lbPhone.text=[delegate.hostUser objectForKey:@"username"];
  
   
    
}

- (IBAction)pay:(id)sender {
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
@end
