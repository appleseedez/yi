//
//  DryCleaningService.m
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningService.h"

@implementation DryCleaningService
static DryCleaningService *instance=nil;
+(instancetype)defaultService{
    return instance;
}
+ (void)initialize
{
    if (self == [DryCleaningService class]) {
        static BOOL didInit=NO;
        if (didInit==NO) {
            instance = [[DryCleaningService alloc]init];
            didInit=YES;
        }
    }
}
-(void)loadServices{
    self.clothesServices=[self requestServices];
}
-(NSArray*)requestServices{
    NSDictionary *c1=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"毛衣",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c2=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"牛仔裤",
                        @"unit":@"件",
                        @"dryprice":@"18",
                        @"waterprice":@"10",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c3=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"内衣",
                        @"unit":@"件",
                        @"dryprice":@"25",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c4=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"运动服",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c5=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"夹克",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c6=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"羊毛衫",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c7=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"T恤",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c8=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"大衣",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c9=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"短裤",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c10=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"长裙",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    NSDictionary *c11=@{ @"id":@"1",
                        @"type":@"gx",
                        @"name":@"啥？",
                        @"unit":@"件",
                        @"dryprice":@"20",
                        @"waterprice":@"15",
                        @"ironingprice":@"12",
                        };
    
    
    return @[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11];
}
@end
