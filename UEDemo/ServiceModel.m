//
//  ServiceModel.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "ServiceModel.h"
#import "OrderSelection.h"
@implementation ServiceModel
+(ServiceModel*)modelWithDictionary:(NSDictionary*)dic{
    ServiceModel *model=[ServiceModel new];
    model.title=[dic objectForKey:@"name"];
    model.type=cleanServiceModelTypeStar;
    NSString *description=[dic objectForKey:@"description"];
    NSArray *arrdes=[description componentsSeparatedByString:@","];
    NSMutableArray *arrOrder=[NSMutableArray new];
    model.numOfStar=[dic objectForKey:@"name"];
    for (NSString *s in arrdes) {
        OrderSelection *o=[OrderSelection new];
        o.name=s;
        o.ID=[dic objectForKey:@"id"];
        [arrOrder addObject:o];
    }
    model.PackSelections=[arrOrder copy];
    
    
    return model;
}
@end
