//
//  HTTPService.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService
static HTTPService *instance=nil;
+(HTTPService*)defaultService{
    
    return instance;
}

+(void)initialize{
    static BOOL initialized=NO;
    if (initialized==NO) {
        instance=[[HTTPService alloc]init];
        initialized=YES;
    }
}
-(NSOperationQueue*)httpQueue{
    if (_httpQueue==nil) {
        _httpQueue=[[NSOperationQueue alloc]init];
        [_httpQueue setMaxConcurrentOperationCount:6];
        [_httpQueue setName:@"HTTP_QUEUE"];
    }
    return _httpQueue;
}
-(RACSignal*)jsonPostRequestWithUrl:(NSString*)url
                         andParameters:(NSDictionary*)parameters
{
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSDictionary *head=@{@"signalType":@(0),@"status":@(0),@"sessionToken":[self getSessionToken]};
    
    NSDictionary *requestParameters=@{@"head":head,@"body":parameters};
    
    NSData *httpBody=[NSJSONSerialization dataWithJSONObject:requestParameters options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:httpBody];
    
    return [self signalWithRequest:request];
}
-(RACSignal*)getRequestWithUrl:(NSString*)url andParameters:(NSDictionary*)parameters{
    
    NSDictionary *head=@{@"signalType":@(0),@"status":@(0),@"sessionToken":[self getSessionToken]};
    
    NSDictionary *requestParameters=@{@"head":head,@"body":parameters};
    NSURLRequest *request=[[AFJSONRequestSerializer serializer] requestWithMethod:@"get" URLString:url parameters:requestParameters error:nil];
    return [self signalWithRequest:request];
}
-(RACSignal*)signalWithRequest:(NSURLRequest*)request{
    
    RACSignal *signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [NSURLConnection sendAsynchronousRequest:request queue:self.httpQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (connectionError) {
                    [subscriber sendError:connectionError];
                }else{
                    NSError *error=nil;
                    id object=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                    if (error) {
                        [subscriber sendNext:data];
                    }else{
                        [subscriber sendNext:object];
                    }
                    [subscriber sendCompleted];
                }
            });
        }];
        return nil;
    }];
    
    return signal;
}
-(NSString*)getSessionToken{
    return @"";
}
@end
