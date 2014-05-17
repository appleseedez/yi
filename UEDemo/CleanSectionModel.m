//
//  CleanSectionModel.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanSectionModel.h"

@implementation CleanSectionModel
+(instancetype)SectionWithModel:(ServiceModel*)model{
    CleanSectionModel *section=[CleanSectionModel new];
    section.title=model.title;
    section.selections=model.PackSelections;
    section.model=model;
    section.selected=@(NO);
    return section;

}
@end
