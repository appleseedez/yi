//
//  MaoAppDelegate.m
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoAppDelegate.h"
#import "CleanService.h"
#import "AppService.h"
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
@implementation MaoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [ShareSDK registerApp:@"3756916947"];
    
    //添加新浪微博应用 注册网址 http://open.weibo.com
    [ShareSDK connectSinaWeiboWithAppKey:@"3756916947"
                               appSecret:@"de85fc7c9bb81ca7ded59052f00b6c56"
                             redirectUri:@"http://open.weibo.com/app/3756916947/privilege/oauth"];

    [ShareSDK connectWeChatWithAppId:@"wx1dc20211dd51ee2c" wechatCls:[WXApi class]];
    
    
   // [ShareSDK importWeChatClass:[WXApi class]];
    
    
    [[CleanService defaultService] loadStarServices];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToRootView) name:@"loginSucces" object:nil];
    return YES;
}
- (BOOL)application:(UIApplication *)application  handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}
-(void)changeToRootView{
    UIStoryboard *main=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *rootVC=[main instantiateInitialViewController];
    CATransition *animation=[CATransition animation];
    animation.type=@"push";
    animation.duration=0.5;
    animation.subtype=@"fromRight";
    [self.window setRootViewController:rootVC];
    [self.window.layer addAnimation:animation forKey:@"login"];
    [[AppService defaultService] getStore];
    
   //
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
