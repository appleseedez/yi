//
//  MyCenterOrderCell.h
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCenterOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgHeader;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property  (nonatomic) UIView *statusView;
@end
