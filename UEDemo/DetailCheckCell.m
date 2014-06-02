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
      [[RACObserve(self, detailModel.selection) map:^id(OrderSelection *value) {
          self.lbTitle.text=value.name;
          
          return value;
      }]subscribeNext:^(id x) {}];
    [[RACObserve(self, detailModel.choosed) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            self.imgCheckBox.image=[UIImage imageNamed:@"selection_choosed"];
        }else{
             self.imgCheckBox.image=[UIImage imageNamed:@"selection_unchoosed"];
        }
        
        return value;
    }]subscribeNext:^(id x) {}];
}

@end
