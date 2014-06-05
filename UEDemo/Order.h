//
//  Order.h
//  UEDemo
//
//  Created by nsc on 14-6-4.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MaoAppDelegate.h"
@interface Order : NSObject
@property (nonatomic) NSString *servicetype;
@property (nonatomic) NSNumber * storeid;
@property (nonatomic) NSString * storename;
@property (nonatomic) NSNumber * allPrice;
@property (nonatomic) NSNumber *userid;
@property (nonatomic) NSString * name;
@property (nonatomic) NSString * phone;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *source;
@property (nonatomic) NSArray *services;
@property (nonatomic,assign) NSDictionary *hostUser;
@property (nonatomic,assign) NSDictionary *currStore;
-(NSDictionary*)toDictionary;
@end
