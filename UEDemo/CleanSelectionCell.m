//
//  CleanSelectionCell.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanSelectionCell.h"

@implementation CleanSelectionCell

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
    self.seperatorView.alpha=0.4;
    self.imgChoosed.image=[UIImage imageNamed:@"tableview_checked"];
    self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"clean_star_selection_cell_normal"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
