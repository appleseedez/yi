//
//  StoreListCell.m
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "StoreListCell.h"

@implementation StoreListCell

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
    // Initialization code
}
-(void)setWithStore:(NSDictionary*)store{
    NSString *name=[store objectForKey:@"name"];
    NSString *address=[store objectForKey:@"address"];
    if ([name isEqual:[NSNull null]]) {
         name=@"";
    }
    if ([address isEqual:[NSNull null]]) {
        address=@"";
    }
    self.lbName.text=name;
    self.lbAddress.text=address;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
