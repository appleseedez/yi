//
//  NSString+MD5.m
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (MD5)
- (NSString *)md5
{
    const char* character = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(character, strlen(character), result);
    
    NSMutableString *md5String = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [md5String appendFormat:@"%02x",result[i]];
    }
    
    return md5String;
}
@end
