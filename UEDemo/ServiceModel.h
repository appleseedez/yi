//
//  ServiceModel.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ENUM(NSInteger, cleanServiceModelType){
    cleanServiceModelTypeStar=0,
    cleanServiceModelTypeWatch=1,
    cleanServiceModelTypeOrder=2
};
@interface ServiceModel : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSArray  *PackSelections; //打包选项
@property (nonatomic) NSArray  *detaiSelections; //细节选项
@property (nonatomic) NSInteger type;    //model类型
@end
