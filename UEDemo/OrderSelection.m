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
@end
