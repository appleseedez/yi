//
//  NFProduct.h
//  alipaydemo
//
//  Created by Zeug on 14/6/18.
//  Copyright (c) 2014年 Northfaith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFProduct : NSObject
@property(nonatomic,copy) NSString* productName;
@property(nonatomic,copy) NSString* subject;
@property(nonatomic,copy) NSString* body;
@property(nonatomic,copy) NSString* orderId;
@property(nonatomic) double price;

@end
