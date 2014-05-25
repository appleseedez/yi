//
//  BaseViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPService.h"
@interface BaseViewModel : NSObject
@property (nonatomic,weak) HTTPService *httpService;
@property (nonatomic)      NSNumber *busy;
-(RACSignal*)httpRequestWithURL:(NSString*)url andParameters:(NSDictionary*)parameters method:(NSString*)method;
@end
