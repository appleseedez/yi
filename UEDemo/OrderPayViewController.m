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
                      target:self];
}
- (NSString *)doRsa:(NSString *)orderInfo {
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedString = [signer signString:orderInfo];
    return signedString;
}
- (void)paymentResult:(NSString *)resultd {
    //结果处理
    AlixPayResult *result = [[AlixPayResult alloc] initWithString:resultd];
    if (result) {
        
        if (result.statusCode == 9000) {
            /*
             *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
             */
            
            //交易成功
            NSString *key = AlipayPubKey; //签约帐户后获取到的支付宝公钥
            id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(key);
            
            if ([verifier verifyString:result.resultString
                              withSign:result.signString]) {
                //验证签名成功，交易结果无篡改
                [CustomAlertWindow showWithText:@"恭喜付款成功"];
            }
        } else {
            //交易失败
            [CustomAlertWindow showWithText:@"抱歉付款失败"];
        }
    } else {
         [CustomAlertWindow showWithText:@"交易出错"];
        //失败
    }
   
}
@end
