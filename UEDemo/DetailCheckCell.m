//
//  DetailCheckCell.m
//  UEDemo
//
//  Created by nsc on 14-6-2.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DetailCheckCell.h"
#import "CleanDetailCheckModel.h"
#import "OrderSelection.h"
@implementation DetailCheckCell

- (void)awakeFromNib
{
    __weak id weakSelf=self;
    
      [[RACObserve(self, detailModel.selection) map:^id(OrderSelection *value) {
          __strong DetailCheckCell *strongSelf=weakSelf;
          strongSelf.lbTitle.text=value.name;
          
          return value;
      }]subscribeNext:^(id x) {}];
    
    [[RACObserve(self, detailModel.choosed) map:^id(NSNumber *value) {
         __strong DetailCheckCell *strongSelf=weakSelf;
        if ([value boolValue]) {
            strongSelf.imgCheckBox.image=[UIImage imageNamed:@"tableview_checked"];
            
            strongSelf.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"clean_star_selection_cell_selectted"]];
        }else{
             strongSelf.imgCheckBox.image=[UIImage imageNamed:@"tableview_unchecked"];
            strongSelf.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"clean_star_selection_cell_normal"]];
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
}

@end
