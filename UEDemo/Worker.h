//
//  Worker.h
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Worker : NSObject
@property  (nonatomic) NSString *name;
@property  (nonatomic) NSString *workID;
@property  (nonatomic) NSArray  *skills;
@property  (nonatomic) NSString *prices;
@property  (nonatomic) NSString *headerImageUrl;
@property  (nonatomic) NSNumber *selected; //bool 是否选中
-(NSString*)skillsString;
@end
