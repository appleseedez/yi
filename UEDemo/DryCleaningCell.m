//
//  DryCleaningCell.m
//  UEDemo
//
//  Created by nsc on 14-5-24.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "DryCleaningCell.h"

@implementation DryCleaningCell

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
    self.seporatorView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background"]];
    
    self.lbDryNum.layer.borderColor=[UIColor whiteColor].CGColor;
    self.lbDryNum.layer.borderWidth=1;
    
    self.lbPirce.text=@"￥ 0";
    self.dryNum=@(0);
    //监听 sourceData
     [[RACObserve(self, sourceData) map:^id(NSDictionary *value) {
         self.lbName.text=[value objectForKey:@"name"];
         self.lbDryPrice.text=[NSString stringWithFormat:@"￥%@ / 件",[value objectForKey:@"price"]];
        
         self.dryNum=[value objectForKey:@"drynumber"];
         self.ironNum=[value objectForKey:@"ironingnumber"];
         
         return value;
     }]subscribeNext:^(id x) {}];
    
    
    //监听 干洗数量
    [[RACObserve(self, dryNum) map:^id(NSNumber *value) {
       
        self.lbDryNum.text=[NSString stringWithFormat:@"%@",value];
        if ([value integerValue]>0) {
            self.didSelected=@(YES);
        }else{
            self.didSelected=@(NO);
        }
        float price=[self.dryNum integerValue]*[[self.sourceData valueForKey:@"price"]  floatValue];
        
        self.lbPirce.text= [NSString stringWithFormat:@"￥ %.2f",price];
        [self.sourceData setValue:value forKey:@"drynumber"];
        return value;
    }]subscribeNext:^(id x) {}];
    
  
    //监听 selected
   [[ RACObserve(self, didSelected) map:^id(id value) {
       if ([value boolValue]) {
           self.contentView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1];
           
       }else{
           self.contentView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
       }
       
       
       return value;
    }]subscribeNext:^(id x) {
        
    }];
    
    //增加手势
     //左划
    UISwipeGestureRecognizer *recognizerL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizerL setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.contentView addGestureRecognizer:recognizerL];
    //右划
    UISwipeGestureRecognizer *recognizerR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizerR setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.contentView addGestureRecognizer:recognizerR];
    
    UILongPressGestureRecognizer *longRecignizer=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongFrom:)];
    [self.contentView addGestureRecognizer:longRecignizer];
    
        
  
    
}
-(void)handleLongFrom:(UISwipeGestureRecognizer *)recognizer{
    self.dryNum=@(0);
}
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
  if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
      if ([self.dryNum integerValue]>0) {
          self.dryNum=@([self.dryNum integerValue]-1);
      }
      
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        self.dryNum=@([self.dryNum integerValue]+1);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
