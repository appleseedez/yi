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
    self.imgHeader.clipsToBounds=YES;
    [self.imgHeader.layer setCornerRadius:self.imgHeader.frame.size.height/2.0];
    __weak id weakSelf=self;
      [RACObserve(self, worker.selected) subscribeNext:^(NSNumber *x) {
          __strong WorkCell *strongSelf=weakSelf;
          if ([x boolValue]) {
              self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"worker_cell_back_normal"]] ;
              strongSelf.imgSelected.image=[UIImage imageNamed:@"tableview_checked"];
          }else{
              self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"worker_cell_back_selected"]] ;
              strongSelf.imgSelected.image=[UIImage imageNamed:@"tableview_unchecked"];
          }
      }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
