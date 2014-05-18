//
//  Worker.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "Worker.h"

@implementation Worker
-(NSString*)skillsString{
    NSString *s=@"技能:";
    for (NSString *k in self.skills) {
        s =[NSString stringWithFormat:@"%@ %@",s,k];
    }
    
    return s;
}
@end
