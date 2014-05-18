//
//  CleanOrderCell.h
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CleanSectionModel.h"

@protocol CleanCellPushDelegate <NSObject>

-(void) pushSubVCWithModel:(ServiceModel*)model;

@end

@interface CleanOrderCell : UITableViewCell
@property (nonatomic,weak) CleanSectionModel *sectionModel;
@property (nonatomic,weak) UIViewController <CleanCellPushDelegate> *contextVC;
@end
