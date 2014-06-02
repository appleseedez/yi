//
//  DetailCheckCell.h
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CheckViewCell.h"
@class CleanDetailCheckModel;
@interface DetailCheckCell : CheckViewCell
@property (nonatomic,weak) CleanDetailCheckModel *detailModel;
@end
