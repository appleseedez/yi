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
    
//    @property (copy) NSString *scheme; // Attempting to set the scheme with an invalid scheme string will cause an exception.
//    @property (copy) NSString *user;
//    @property (copy) NSString *password;
//    @property (copy) NSString *host;
//    @property (copy) NSNumber *port; // Attempting to set a negative port number will cause an exception.
//    @property (copy) NSString *path;
//    @property (copy) NSString *query;
//    @property (copy) NSString *fragment;
//    
    
    
//   
//    
//    
//    [request setHTTPMethod:@"GET"];
//    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    NSDictionary *head=@{@"signalType":@(0),@"status":@(0),@"sessionToken":[self getSessionToken]};
//    
//    NSDictionary *requestParameters=@{@"head":head,@"body":parameters};
//    
//    NSData *httpBody=[NSJSONSerialization dataWithJSONObject:requestParameters options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *query=[[NSString alloc] initWithData:httpBody encoding:NSUTF8StringEncoding];
//    NSString *qurl=[NSString stringWithFormat:@"%@?head=1",url];
//     NSURL *surl=[NSURL URLWithString:qurl];
//    [request setURL:surl];
//    NSLog(@"scheme:%@",surl.scheme);
//    NSLog(@"user:%@",surl.user);
//    NSLog(@"password:%@",surl.password);
//    NSLog(@"port:%@",surl.port);
//    NSLog(@"path:%@",surl.path);
//    NSLog(@"query:%@",surl.query);
//    NSLog(@"fragment:%@",surl.fragment);
   
        NSDictionary *head=@{@"signalType":@(0),@"status":@(0),@"sessionToken":[self getSessionToken]};
    
    NSDictionary *requestParameters=@{@"head":head,@"body":parameters};
    
    NSError *error=nil;
    NSData *data=[NSJSONSerialization dataWithJSONObject:head options:NSJSONWritingPrettyPrinted error:nil];
    NSString *s=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSURLRequest *request= [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:@{@"head":data} error:&error];
    
    NSMutableURLRequest *mRequest=[request mutableCopy];
    NSLog(@"%@",request.URL);
    if (error) {
        NSLog(@"%@",error);
    }
    
    
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
