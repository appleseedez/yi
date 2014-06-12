//
//  CleanOrderDetailCell.m
//  UEDemo
//
//  Created by nsc on 14-6-12.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanOrderDetailCell.h"

@implementation CleanOrderDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.btnOrder.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnOrder.layer.borderWidth=1;
    [self.btnOrder addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    // Initialization code
}
-(void)push{
    [self.controller pushSubVCWithModel:self.model];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
