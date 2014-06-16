//
//  DryCleaningCell.h
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DryCleaningCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgHeader;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbDryPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbPirce;

@property (weak, nonatomic) IBOutlet UILabel *lbDryNum;


@property (nonatomic) NSNumber *dryNum;
@property (nonatomic) NSNumber *ironNum;
@property (nonatomic) NSNumber *didSelected;
@property (weak, nonatomic) IBOutlet UIView *seporatorView;

@property (nonatomic) NSDictionary *sourceData;
@end
