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
    // Initialization code
}
-(void)setStatusView:(UIView *)statusView{
    if (_statusView) {
        [_statusView removeFromSuperview];
        _statusView=nil;
    }
    _statusView=statusView;
    _statusView.center=CGPointMake(320-statusView.frame.size.width, self.frame.size.height/2.0);
    [self.contentView addSubview:statusView];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
