//
//  WorkCell.m
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "WorkCell.h"
#import "Worker.h"
@implementation WorkCell

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
      [RACObserve(self, worker.selected) subscribeNext:^(NSNumber *x) {
          __strong WorkCell *strongSelf=weakSelf;
          if ([x boolValue]) {
              strongSelf.imgSelected.image=[UIImage imageNamed:@"selection_choosed"];
          }else{
              strongSelf.imgSelected.image=[UIImage imageNamed:@"selection_unchoosed"];
          }
      }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
