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
    __weak id weakSelf=self;
    [RACObserve(self, orderSelection.choosed) subscribeNext:^(NSNumber *x) {
        __strong CleanSelectionCell *strongSelf=weakSelf;
        if ([x boolValue]) {
            strongSelf.imgChoosed.image=[UIImage imageNamed:@"selection_choosed"];
        }else{
            strongSelf.imgChoosed.image=[UIImage imageNamed:@"selection_unchoosed"];
        }
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
