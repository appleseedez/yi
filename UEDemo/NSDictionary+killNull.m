//
//  NSDictionary+killNull.m
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "NSDictionary+killNull.h"

@implementation NSDictionary (killNull)
-(NSDictionary*)killNull{
    NSMutableDictionary *noNullDic=[self mutableCopy];
    for (NSString *key in self.allKeys) {
        id value=[self objectForKey:key];
        if ([value isEqual:[NSNull null]]) {
            [noNullDic setObject:@"" forKey:key];
        }
    }
    return [noNullDic copy];
}
@end
