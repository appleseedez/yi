//
//  OrderSelection.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "OrderSelection.h"

@implementation OrderSelection
+(instancetype)selectionWithName:(NSString*)name price:(NSString*)price ID:(NSNumber*)ID suSelections:(NSArray*)subSelections{
    OrderSelection *sel=[OrderSelection new];
    sel.name=name;
    if (price==nil) {
        NSMutableArray *prices=[NSMutableArray new];
        for (OrderSelection *selection in subSelections) {
            [prices addObject:@{@"price": selection.price} ];
            
        }
        sel.price=[prices valueForKeyPath:@"@sum.price"];
        NSLog(@"price:%@",sel.price);
           }else{
               sel.price=price;
    }
    sel.ID=ID;
    sel.subSelections=subSelections;
    return sel;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak id weakSelf=self;
         [RACObserve(self, choosed) subscribeNext:^(NSNumber  *x) {
             __strong OrderSelection *strongSelf=weakSelf;
             __weak NSNumber *weakChoosed=x;
                 if ([strongSelf.subSelections count]) {
                     for (OrderSelection *s in strongSelf.subSelections) {
                         s.choosed=weakChoosed;
                     }
                 
             }
         }];
    }
    return self;
}
@end
