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
-(void)loadServiceModels{
        
#if TEST
    ServiceModel *star1=[ServiceModel new];
    star1.title=@"一星服务";
    NSArray *nameArr1= @[@"一星打包选项1",@"一星打包选项2",@"一星打包选项3"];
    NSArray *priceArr1=@[@"50",@"90",@"80",@"50",@"60",@"30"];
    NSArray *subArr1=@[@[@(1),@(2)],@[@(4),@(2),@(4)],@[@(1),@(3),@(5),@(0)]];
    NSArray *NameArrSub1=@[@"一星选项1",@"一星选项2",@"一星选项3",@"一星选项4",@"一星选项5",@"一星选项6"];
    NSMutableArray *packArr=[@[] mutableCopy];
    NSMutableArray *detailArr=[@[] mutableCopy];
    for (NSString *s in NameArrSub1) {
        int i =[NameArrSub1 indexOfObject:s];
        OrderSelection *selection=[OrderSelection selectionWithName:s price:priceArr1[i] ID:@(3) suSelections:@[]];
        [detailArr addObject:selection];
    }
    star1.detaiSelections=[detailArr copy];
    for (NSString *s in nameArr1) {
        int i = [nameArr1 indexOfObject:s];
        NSArray *sub=subArr1[i];
        NSMutableArray *subSlections=[NSMutableArray new];
        for (NSNumber *n in sub) {
            [subSlections addObject:[star1.detaiSelections objectAtIndex:[n intValue]]];
        }
        
        OrderSelection *selection=[OrderSelection selectionWithName:nameArr1[i] price:nil ID:@(3) suSelections:subSlections];
        [packArr addObject:selection];
    }
    star1.PackSelections=[packArr copy];
    
    
    star1.type=cleanServiceModelTypeStar;
    
    ServiceModel *star2=[ServiceModel new];
    star2.title=@"二星服务";
    NSArray *nameArr2= @[@"二星打包选项1",@"二星打包选项2",@"二星打包选项3"];
    NSArray *priceArr2=@[@"50",@"90",@"80",@"50",@"60",@"30"];
    NSArray *subArr2=@[@[@(1),@(2)],@[@(3),@(2),@(4)],@[@(1),@(3),@(5),@(0)]];
    NSArray *NameArrSub2=@[@"二星选项1",@"二星选项2",@"二星选项3",@"二星选项4",@"二星选项5",@"二星选项6"];
    NSMutableArray *packArr2=[@[] mutableCopy];
    NSMutableArray *detailArr2=[@[] mutableCopy];
    for (int i=0; i<6; i++) {
        OrderSelection *selection=[OrderSelection selectionWithName:NameArrSub2[i] price:priceArr2[i] ID:@(3) suSelections:@[]];
        [detailArr2 addObject:selection];
    }
    star2.detaiSelections=[detailArr2 copy];
    for (NSString *s in nameArr2) {
        int i = [nameArr2 indexOfObject:s];
        NSArray *sub=subArr2[i];
        NSMutableArray *subSlections=[NSMutableArray new];
        for (NSNumber *n in sub) {
            [subSlections addObject:[star2.detaiSelections objectAtIndex:[n intValue]]];
        }
        
        OrderSelection *selection=[OrderSelection selectionWithName:nameArr2[i] price:nil ID:@(3) suSelections:subSlections];
        [packArr2 addObject:selection];
    }
    star2.PackSelections=[packArr2 copy];
    star2.type=cleanServiceModelTypeStar;
    
    ServiceModel *star3=[ServiceModel new];
    star3.title=@"三星服务";
    NSArray *nameArr3= @[@"三星打包选项1",@"三星打包选项2",@"三星打包选项3"];
    NSArray *priceArr3=@[@"50",@"90",@"80",@"50",@"60",@"30"];
    NSArray *subArr3=@[@[@(0),@(2)],@[@(1),@(2),@(4)],@[@(1),@(3),@(5),@(0)]];
    NSArray *NameArrSub3=@[@"三星选项1",@"三星选项2",@"三星选项3",@"三星选项4",@"三星选项5",@"三星选项6"];
    NSMutableArray *packArr3=[@[] mutableCopy];
    NSMutableArray *detailArr3=[@[] mutableCopy];
    for (int i=0; i<6; i++) {
        OrderSelection *selection=[OrderSelection selectionWithName:NameArrSub3[i] price:priceArr3[i] ID:@(3) suSelections:@[]];
        [detailArr3 addObject:selection];
    }
    star3.detaiSelections=[detailArr3 copy];
    for (NSString *s in nameArr3) {
        int i = [nameArr3 indexOfObject:s];
        NSArray *sub=subArr3[i];
        NSMutableArray *subSlections=[NSMutableArray new];
        for (NSNumber *n in sub) {
            [subSlections addObject:[star3.detaiSelections objectAtIndex:[n intValue]]];
        }
        
        OrderSelection *selection=[OrderSelection selectionWithName:nameArr3[i] price:nil ID:@(3) suSelections:subSlections];
        [packArr3 addObject:selection];
    }
    star3.PackSelections=[packArr3 copy];
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
