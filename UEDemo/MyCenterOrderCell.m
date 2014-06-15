//
//  MyCenterOrderCell.m
//  UEDemo
//
//  Created by nsc on 14-6-7.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MyCenterOrderCell.h"

@implementation MyCenterOrderCell

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
    self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"center_cell_back_high"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"center_cell_back_normal"]];
    }else{
        self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"center_cell_back_high"]];
    }
    // Configure the view for the selected state
}

@end
