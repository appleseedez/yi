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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(choose:) name:@"CleanCellSelected" object:nil];
    [self.btnSelected addTarget:self action:@selector(chooseNotify:) forControlEvents:UIControlEventTouchDown];
    __weak id weakSelf=self;
    [RACObserve(self, sectionModel.selections) subscribeNext:^(NSArray *x) {
        __strong CleanTableViewCell *strongSelf=weakSelf;
        if ([x count]) {
            [strongSelf.btnSelected setHidden:NO];
        }else{
            [strongSelf.btnSelected setHidden:YES];
        }
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)chooseNotify:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CleanCellSelected" object:self userInfo:nil];
}

-(void)choose:(NSNotification*)notification{
    if (notification.object==self) {
        BOOL selected=[self.sectionModel.selected boolValue];
        self.sectionModel.selected=@(!selected);
    }else{
        self.sectionModel.selected=@(NO);
    }
    
        CATransition *animation=[CATransition animation];
      //animation.type=@"moveIn";
        [self.tableView reloadData];
    [self.tableView.layer addAnimation:animation forKey:@""];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
