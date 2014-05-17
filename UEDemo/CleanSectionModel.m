//
//  CleanSectionModel.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanSectionModel.h"

@implementation CleanSectionModel
+(instancetype)loadWith:(NSInteger)starService{
    CleanSectionModel *model=[[CleanSectionModel alloc]init];
    switch (starService) {
        case 1:
            [model Star1Service];
            break;
        case 2:
            [model Star2Service];
            break;
        case 3:
            [model Star3Service];
            break;
        case 4:
            [model Star4Service];
            break;
        case 5:
            [model Star5Service];
            break;
        default:
            break;
    }
    return model;
}

-(void)Star1Service{
    self.title=@"一星服务";
    self.selections=@[@"一星选项1",@"一星选项2",@"一星选项3",@"一星选项4",@"一星选项5",@"一星选项6"];
}
-(void)Star2Service{
    self.title=@"二星服务";
    self.selections=@[@"二星选项1",@"二星选项2",@"二星选项3",@"二星选项4",@"二星选项5"];
}
-(void)Star3Service{
    self.title=@"三星服务";
    self.selections=@[@"三星选项1",@"三星选项2",@"三星选项3",@"三星选项4"];
}
-(void)Star4Service{
    self.title=@"四星服务";
    self.selections=@[@"四星选项1",@"四星选项2",@"四星选项3",@"四星选项4",@"四星选项5"];
}
-(void)Star5Service{
    self.title=@"五星服务";
    self.selections=@[@"五星选项1",@"五星选项2",@"五星选项3"];
}
- (id)copyWithZone:(NSZone *)zone{
    CleanSectionModel *model=[[CleanSectionModel allocWithZone:zone]init];
    model.title=self.title;
    model.selections=self.selections;
    model.selected=self.selected;
    return model;
}
@end
