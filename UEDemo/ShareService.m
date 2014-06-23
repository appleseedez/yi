//
//  ShareService.m
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "ShareService.h"
#import <ShareSDK/ShareSDK.h>
@implementation ShareService
static ShareService *instance;
+(instancetype)defautService{
    return instance;
}
+ (void)initialize
{
    if (self == [ShareService class]) {
        static BOOL didInit=NO;
        if (didInit==NO) {
            instance=[[[self class] alloc]init];
            didInit=YES;
        }
    }
}
-(void)shareWithTitle:(NSString*)title content:(NSString*)content type:(NSString*)type{
    //构造分享内容
    ShareType shareType;
    if ([type isEqualToString:@"微博"]) {
        shareType=ShareTypeSinaWeibo;
    }else if ([type isEqualToString:@"微信朋友圈"]){
        shareType=ShareTypeWeixiTimeline;
    }else if ([type isEqualToString:@"微信好友"]){
        shareType=ShareTypeWeixiSession;
    }
    
    
    id<ISSContent> publishContent = [ShareSDK content:content
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:nil
                                                title:title
                                                  url:nil
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    
//    [ShareSDK oneKeyShareContent:nil shareList:@[@(ShareTypeWeixiSession)] authOptions:nil shareOptions:nil statusBarTips:YES result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//        
//    }];
    [ShareSDK shareContent:publishContent type:shareType authOptions:nil shareOptions:nil statusBarTips:YES result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
        if (state == SSResponseStateSuccess)
        {
            NSDictionary *info=[statusInfo sourceData];
            NSLog(@"statusInfo:%@",info);
            NSLog(@"分享成功");
        }
        else if (state == SSResponseStateFail)
        {
            NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
        }
    }];
}
@end
