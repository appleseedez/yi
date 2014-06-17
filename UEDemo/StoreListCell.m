//
//  StoreListCell.m
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "StoreListCell.h"
#import "AppService.h"
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelOther) name:@"storeListCellChoosed" object:nil];
    __weak id weakSelf=self;
    [[RACObserve(self, choosed) map:^id(NSNumber *value) {
        __strong StoreListCell *strongSelf=weakSelf;
        [strongSelf.store setValue:strongSelf.choosed forKeyPath:@"choosed"];
        if ([value boolValue]) {
            [strongSelf.btnBack setBackgroundImage:[UIImage imageNamed:@"store_tableview_unselected"] forState:UIControlStateNormal];
            strongSelf.imgChecked.image=[UIImage imageNamed:@"tableview_checked"];
            strongSelf.contextController.choosedStore=strongSelf.store;
        }else{
            [strongSelf.btnBack setBackgroundImage:[UIImage imageNamed:@"store_tableview_selected"] forState:UIControlStateNormal];
            strongSelf.imgChecked.image=[UIImage imageNamed:@"tableview_unchecked"];
        }
        
        
        return value;
    }]subscribeNext:^(id x) {}];
    [self.btnBack addTarget:self action:@selector(beChoosed) forControlEvents:UIControlEventTouchDown];
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
    self.store=store;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
         self.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"60背景"]];
    }
   
    // Configure the view for the selected state
}
static id currChoosed;
-(void)beChoosed{
    [AppService defaultService].choosdStore=self.store;
    currChoosed=self;
    self.choosed=@(![self.choosed boolValue]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"storeListCellChoosed" object:nil userInfo:nil];
}
-(void)cancelOther{
    if (self!=currChoosed) {
        self.choosed=@(NO);
    }
}
@end
