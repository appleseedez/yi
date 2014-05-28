//
//  CleanSectionModel.h
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CleanService.h"
@interface CleanSectionModel : NSObject

@property (nonatomic) NSArray *selections; //section中得可选项目
@property (nonatomic) NSString *title;     //section的标题
@property (nonatomic) NSNumber *selected; // 检测是否被选中
@property (nonatomic,weak) ServiceModel *model;
@property (nonatomic) NSMutableArray *indexPaths;
+(instancetype)SectionWithModel:(ServiceModel*)model;
@end
