//
//  CheckViewCell.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CheckViewCell.h"

@implementation CheckViewCell

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
        __strong CheckViewCell *strongSelf=weakSelf;
        if ([x boolValue]) {
            strongSelf.imgCheckBox.image=[UIImage imageNamed:@"selection_choosed"];
        }else{
            strongSelf.imgCheckBox.image=[UIImage imageNamed:@"selection_unchoosed"];
        }
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
