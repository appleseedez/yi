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
@property  (nonatomic) NSString *storeid;
@property  (nonatomic) NSString *storename;
@property  (nonatomic) NSString *sex;
@property  (nonatomic) NSString *age;
@property  (nonatomic) NSString *lowprice;
@property  (nonatomic) NSString *avatar;
@property  (nonatomic) NSString *strSkills;
@property  (nonatomic) NSNumber *workeyears;
-(NSString*)skillsString;
@end
