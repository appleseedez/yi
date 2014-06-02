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
    sel.ID=ID;
    
    return sel;
}
+(instancetype)selectionsWithDictionary:(NSDictionary*)dic{
    OrderSelection *selection=[OrderSelection new];
    
    selection.name=[dic objectForKey:@"name"];
    selection.ID=[dic objectForKey:@"id"];
    selection.price=[dic objectForKey:@"price"];
    
    
    return selection;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}
@end
