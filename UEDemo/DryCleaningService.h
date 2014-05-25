//
//  DryCleaningService.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DryCleaningService : NSObject
+(instancetype)defaultService;
@property (nonatomic) NSArray *clothesServices;
-(void)loadServices;
@end
