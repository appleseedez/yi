//
//  AppService.h
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HostInfomation.h"
#import "BaseViewModel.h"
#import <CoreLocation/CoreLocation.h>
@interface AppService : BaseViewModel <CLLocationManagerDelegate>
+(instancetype)defaultService;
@property (nonatomic) HostInfomation *hostInfomation;
@property (nonatomic) UIWindow *storeSettingWindow;
@property (nonatomic) NSNumber *showStoreSetting;
@property (nonatomic) NSNumber *storeListLoaded;
@property (nonatomic) NSDictionary *choosdStore;
-(void)getStore;
-(void) getLocation;
-(void)changeHostValue:(id)value forKey:(NSString*)key;
-(void)showScanOrder:(NSString*)text;
-(void)callCurrStrore;
@end
