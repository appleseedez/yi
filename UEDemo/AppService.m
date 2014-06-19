//
//  AppService.m
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "AppService.h"
#import <MapKit/MapKit.h>
#import "MaoAppDelegate.h"
#import "StoreListViewController.h"
#import "OrderWaitingServiceViewController.h"
#import "NSDictionary+killNull.h"
#import "MaoRootViewController.h"
@interface AppService ()
@property(nonatomic) CLLocationManager *locationManager;
@end
@implementation AppService
static AppService *instance = nil;
+ (instancetype)defaultService {

  return instance;
}

+ (void)initialize {
  static BOOL initialized = NO;
  if (initialized == NO) {
    instance = [[AppService alloc] init];
    initialized = YES;
  }
}
- (void)getLocation {

  // if location services are restricted do nothing
  if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ||
      [CLLocationManager authorizationStatus] ==
          kCLAuthorizationStatusRestricted) {
    return;
  }

  // if locationManager does not currently exist, create it
  if (!self.locationManager) {
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    self.locationManager.distanceFilter =
        1000.0f; // we don't need to be any more accurate than 10m
  }

  [_locationManager startUpdatingLocation];
  self.hostInfomation.coordinatex =
      @(self.locationManager.location.coordinate.latitude);
  self.hostInfomation.coordinatey =
      @(self.locationManager.location.coordinate.longitude);
  //  CLLocationManager *locationManager = [[CLLocationManager alloc] init];
  //  locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  //  locationManager.delegate = self;
  //  locationManager.distanceFilter = 1000.0f;
  //  [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
  // 获取经纬度
  NSLog(@"纬度:%f", newLocation.coordinate.latitude);
  NSLog(@"经度:%f", newLocation.coordinate.longitude);
  // 停止位置更新
  self.hostInfomation.coordinatex = @(manager.location.coordinate.latitude);
  self.hostInfomation.coordinatey = @(manager.location.coordinate.longitude);
  [manager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
  NSLog(@"error:%@", error);
}
- (instancetype)init {
  self = [super init];
  if (self) {
    __weak id weakSelf = self;
    [[RACObserve(self, showStoreSetting) map:^id(NSNumber *value) {
        __strong AppService *strongSelf = weakSelf;
        if ([value boolValue]) {
          UIStoryboard *searchStory =
              [UIStoryboard storyboardWithName:@"search" bundle:nil];
          [strongSelf.storeSettingWindow
              setRootViewController:[searchStory
                                            instantiateInitialViewController]];

          [strongSelf.storeSettingWindow makeKeyAndVisible];
          [strongSelf getLocation];
          [strongSelf loadStoreList];

        } else {
          MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
          [delegate.window makeKeyAndVisible];
        }

        return value;
    }] subscribeNext:^(id x) {}];
  }
  return self;
}
- (UIWindow *)storeSettingWindow {
  if (_storeSettingWindow == nil) {
    _storeSettingWindow = [[UIWindow alloc] init];
    _storeSettingWindow.frame = [UIScreen mainScreen].bounds;
  }
  return _storeSettingWindow;
}
- (void)loadStoreList {
  self.storeListLoaded = @(NO);
  NSString *url = [NSString
      stringWithFormat:@"%@/eclean/loadRecentStores.json", ACCOUNT_SERVER];

  NSNumber *coordinatex = self.hostInfomation.coordinatex;
  NSNumber *coordinatey = self.hostInfomation.coordinatey;
  if (coordinatex == nil) {
    coordinatex = @(0);
  }
  if (coordinatey == nil) {
    coordinatey = @(0);
  }
  NSDictionary *parameters = @{
    @"coordinatex" : coordinatex,
    @"coordinatey" : coordinatey
  };
  [[[self httpRequestWithURL:url andParameters:parameters method:nil]
      map:^id(NSArray *value) {
          NSArray *storeList = [self reOrderStoreList:value];
          self.storeListLoaded = @(YES);
          self.storeListLoaded = @(NO);
          UIStoryboard *searchStory =
              [UIStoryboard storyboardWithName:@"search" bundle:nil];
          StoreListViewController *vc = [searchStory
              instantiateViewControllerWithIdentifier:@"storeList"];
          vc.storeList = storeList;
          // UINavigationController *nav=[[UINavigationController
          // alloc]initWithRootViewController:vc];
          [self.storeSettingWindow setRootViewController:vc];
          return value;
      }] subscribeNext:^(id x) {}];
}
- (void)changeHostValue:(id)value forKey:(NSString *)key {
  MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
  NSMutableDictionary *host = [delegate.hostUser mutableCopy];
  [host setObject:value forKey:key];
  delegate.hostUser = [host copy];
}
- (NSArray *)reOrderStoreList:(NSArray *)storeList {
  return storeList;
}
- (void)getStore {

  //       NSNumber *storeid=[[NSUserDefaults standardUserDefaults]
  //       objectForKey:@"storeid"];
  //
  //    if (storeid) {
  //        [self getCurrStore:storeid];
  //    }else{
  //        self.showStoreSetting=@(YES);
  //    }
  NSDictionary *store =
      [[NSUserDefaults standardUserDefaults] objectForKey:@"store"];
  if (!store) {
    store = @{
      @"id" : @(21),
      @"name" : @"八里小区店",
      @"address" : @"东一街",
      @"logo" : @"http://picture.com/jd/332/22/101.jpg",
      @"coordinatex" : @(5678),
      @"coordinatey" : @(345),
      @"services" : @"保洁，干洗，钟点工",
      @"introduce" : @"这是一个店",
      @"servers" : @[
        @{
          @"id" : @(12),
          @"storeid" : @(1), //门店 id
          @"storename" : @"门店名称",
          @"name" : @"张小霞",
          @"sex" : @(0),
          @"age" : @(25),
          @"workyears" : @(3),
          @"skills" : @"洗衣,做饭",
          @"lowprice" : @(14),
          @"price" : @(25),
          @"avatar" : @""
        },
        @{
          @"id" : @(12),
          @"storeid" : @(1), //门店 id
          @"storename" : @"门店名称",
          @"name" : @"田芳",
          @"sex" : @(0),
          @"age" : @(25),
          @"workyears" : @(3),
          @"skills" : @"洗衣,做饭",
          @"lowprice" : @(14),
          @"price" : @(25),
          @"avatar" : @""
        }
      ]
    };

    MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.currStore = store;
    [[NSUserDefaults standardUserDefaults] setObject:store forKey:@"store"];
  } else {
    MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.currStore = store;
  }
}
- (void)getCurrStore:(NSNumber *)storeid {
  MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
  NSString *url = [NSString
      stringWithFormat:@"%@/eclean/showOneStore.json", ACCOUNT_SERVER];
  NSDictionary *parameters = @{
    @"storeid" : storeid,
    @"username" : [delegate.hostUser objectForKey:@"username"]
  };
  [[self httpRequestWithURL:url andParameters:parameters
                     method:@"post"] subscribeNext:^(NSDictionary *x) {
      MaoAppDelegate *delegate = [UIApplication sharedApplication].delegate;
      delegate.currStore = x;
      [[NSUserDefaults standardUserDefaults] setObject:[x objectForKey:@"id"]
                                                forKey:@"storeid"];
  }];
}
- (void)showScanOrder:(NSString *)text {
  // d39ae6f6-9927-4254-ae22-628882944481
  NSString *url = [NSString
      stringWithFormat:@"%@/eclean/findOrderByNo.json", ACCOUNT_SERVER];
  NSDictionary *parameters = @{
    @"orderno" : text
  };
  [[self httpRequestWithURL:url andParameters:parameters
                     method:@"post"] subscribeNext:^(NSDictionary *x) {
      UIStoryboard *story =
          [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      OrderWaitingServiceViewController *orderVC =
          [story instantiateViewControllerWithIdentifier:@"orderView"];
      UINavigationController *nav =
          [[UINavigationController alloc] initWithRootViewController:orderVC];
      nav.navigationBarHidden = YES;
     //MaoRootViewController *rootVC =
          //(MaoRootViewController*)[UIApplication sharedApplication].delegate.window.rootViewController;
      orderVC.order = [x killNull];
      
      [[NSNotificationCenter defaultCenter] postNotificationName:@"showOrder" object:nav];
  }];
   
}
@end
