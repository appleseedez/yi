//
//  DryCleaningCell.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DryCleaningCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgSelected;
@property (weak, nonatomic) IBOutlet UIImageView *imgHeader;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbDryPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbWaterPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbIroningPrice;

@property (weak, nonatomic) IBOutlet UIButton *btnDeDry;
@property (weak, nonatomic) IBOutlet UIButton *btnAcDry;
@property (weak, nonatomic) IBOutlet UILabel *lbDryNum;

@property (weak, nonatomic) IBOutlet UILabel *lbIronNum;
@property (weak, nonatomic) IBOutlet UIButton *btnDeIron;
@property (weak, nonatomic) IBOutlet UIButton *btnAcIron;
@property (nonatomic) NSNumber *dryNum;
@property (nonatomic) NSNumber *ironNum;
@property (nonatomic) NSNumber *didSelected;

@property (nonatomic) NSDictionary *sourceData;
@end
