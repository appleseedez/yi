//
//  AppService.m
//  UEDemo
//
//  Created by nsc on 14-5-26.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "AppService.h"
#import <MapKit/MapKit.h>
@implementation AppService
static AppService *instance=nil;
+(instancetype)defaultService{
    
    return instance;
}

+(void)initialize{
    static BOOL initialized=NO;
    if (initialized==NO) {
        instance=[[AppService alloc]init];
        initialized=YES;
    }
}
-(void) getLocation{
    CLLocationManager *locationManager=[[CLLocationManager alloc]init];
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    locationManager.distanceFilter=1000.0f;
    self.hostInfomation.coordinatex=[NSString stringWithFormat:@"%g",locationManager.location.coordinate.latitude];
    self.hostInfomation.coordinatey=[NSString stringWithFormat:@"%g",locationManager.location.coordinate.longitude];
}
@end
