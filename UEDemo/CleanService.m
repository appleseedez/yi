//
//  CleanService.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanService.h"
#import "OrderSelection.h"
static CleanService *instance=nil;
@implementation CleanService
+(instancetype)defaultService{
    return instance;
}
+ (void)initialize
{     static BOOL didInit=NO;
    if (self == [CleanService class]) {
        if (didInit==NO) {
            instance=[[self class] new];
            didInit=YES;
        }
    }
}
-(void)loadStarServices{
        
#if TEST
    ServiceModel *star1=[ServiceModel new];
    star1.title=@"一星服务";
    NSArray *nameArr1= @[@"一星打包选项1",@"一星打包选项2",@"一星打包选项3"];
    
    NSMutableArray *orders1=[NSMutableArray new];
    for (NSString *x in nameArr1) {
       
        OrderSelection *o=[[OrderSelection alloc]init];
        o.name=x;
        o.price=@"0";
        o.ID=@(1);
        [orders1 addObject:o];
    }
    star1.PackSelections=orders1;
    star1.type=cleanServiceModelTypeStar;
    
    ServiceModel *star2=[ServiceModel new];
    star2.title=@"二星服务";
    NSArray *nameArr2= @[@"二星打包选项1",@"二星打包选项2",@"二星打包选项3"];
   
   NSMutableArray *orders2=[NSMutableArray new];
   
    for (NSString *x in nameArr2) {
        
        OrderSelection *o=[[OrderSelection alloc]init];
        o.name=x;
        o.price=@"0";
        o.ID=@(1);
        [orders2 addObject:o];
    }
    star2.PackSelections=orders2;
    star2.type=cleanServiceModelTypeStar;
    
    ServiceModel *star3=[ServiceModel new];
    star3.title=@"三星服务";
    NSArray *nameArr3= @[@"三星打包选项1",@"三星打包选项2",@"三星打包选项3"];
    
    
    NSMutableArray *orders3=[NSMutableArray new];
    
    for (NSString *x in nameArr3) {
        
        OrderSelection *o=[[OrderSelection alloc]init];
        o.name=x;
        o.price=@"0";
        o.ID=@(1);
        [orders3 addObject:o];
    }
    star3.PackSelections=orders3;
    star3.type=cleanServiceModelTypeStar;
    
    
    
    ServiceModel *watch=[ServiceModel new];
    watch.title=@"观看流程";
    watch.type=cleanServiceModelTypeWatch;
    
    ServiceModel *order=[ServiceModel new];
    order.title=@"我要定制";
    order.type=cleanServiceModelTypeOrder;
    self.serviceModels = @[star1,star2,star3,watch,order];
 #endif
}























@end
