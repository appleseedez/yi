//
//  CleanTableViewCell.m
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanTableViewCell.h"
#import "CleanSectionModel.h"
@implementation CleanTableViewCell



- (void)awakeFromNib
{
    [self.btnSelected addTarget:self action:@selector(choose) forControlEvents:UIControlEventTouchDown];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)choose{
     BOOL selected= [self.sectionModel.selected boolValue];
    self.sectionModel.selected=@(!selected);
    CATransition *animation=[CATransition animation];
      //animation.type=@"moveIn";
        [self.tableView reloadData];
    [self.tableView.layer addAnimation:animation forKey:@""];
    
}
@end
