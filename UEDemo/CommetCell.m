//
//  CommetCell.m
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CommetCell.h"

@implementation CommetCell

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
    self.starView=[[StarView alloc]init];
    self.starView.frame=CGRectMake(80, 10, 40, 10);
    [self.starView loadStars:8];
    [self.contentView addSubview: self.starView];
    self.starView.userInteractionEnabled=NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        self.contentView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
    }else{
        self.contentView.backgroundColor=[UIColor clearColor];
    }
    // Configure the view for the selected state
}
-(void)loatCommet:(NSDictionary*)data{
    NSString *username=[data objectForKey:@"username"];
    if (!username.length) {
         username=@"蓉么么顾客";
    }
    self.lbName.text=username;
    self.lbCommet.text=[data objectForKey:@"content"];
}
@end
