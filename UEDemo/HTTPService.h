//
//  HTTPService.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPService : NSObject
@property (nonatomic) NSOperationQueue *httpQueue;
+(HTTPService*)defaultService;
-(RACSignal*)signalWithRequest:(NSURLRequest*)request;
-(RACSignal*)getRequestWithUrl:(NSString*)url andParameters:(NSDictionary*)parameters;
-(RACSignal*)jsonPostRequestWithUrl:(NSString*)url andParameters:(NSDictionary*)parameters;
@end
