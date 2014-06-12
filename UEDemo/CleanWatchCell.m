//
//  CleanWatchCell.m
//  UEDemo
//
//  Created by nsc on 14-6-12.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanWatchCell.h"

@implementation CleanWatchCell

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
    self.btnWatch.layer.borderColor=[UIColor whiteColor].CGColor;
    self.btnWatch.layer.borderWidth=1;
    [self.btnWatch addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)push{
    [self.controller pushSubVCWithModel:self.model];
}
@end
