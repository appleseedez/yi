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
