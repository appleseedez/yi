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
    if (self.strSkills) {
        return self.strSkills;
    }
    NSString *s=@"技能:";
    for (NSString *k in self.skills) {
        s =[NSString stringWithFormat:@"%@ %@",s,k];
    }
    
    return s;
}

+(Worker*)workerWithDictionary:(NSDictionary*)dic{
    Worker *w=[Worker new];
    w.workID=dic[@"id"];
    w.name=dic[@"name"];
    w.sex=dic[@"sex"];
    w.age=dic[@"age"];
    w.strSkills=dic[@"skills"];
    
    return w;
}
-(NSDictionary*)toDictionary{
    NSDictionary *d=@{@"itemid":self.workID,@"name":self.name};
    return d;
}
@end
