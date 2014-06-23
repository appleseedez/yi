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
    
    [self.btnAdd addTarget:self action:@selector(numberAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.btnManus addTarget:self action:@selector(numberManus) forControlEvents:UIControlEventTouchUpInside];
    //监听 sourceData
    
    __weak id weakSelf=self;
     [[RACObserve(self, sourceData) map:^id(NSDictionary *value) {
         __strong DryCleaningCell *strongSelf=weakSelf;
         strongSelf.lbName.text=[value objectForKey:@"name"];
         strongSelf.lbDryPrice.text=[NSString stringWithFormat:@"￥%@ / 件",[value objectForKey:@"price"]];
        
         strongSelf.dryNum=[value objectForKey:@"drynumber"];
         strongSelf.ironNum=[value objectForKey:@"ironingnumber"];
         
         return value;
     }]subscribeNext:^(id x) {}];
    
    
    //监听 干洗数量
    [[RACObserve(self, dryNum) map:^id(NSNumber *value) {
        __strong DryCleaningCell *strongSelf=weakSelf;
        strongSelf.lbDryNum.text=[NSString stringWithFormat:@"%@",value];
        if ([value integerValue]>0) {
            strongSelf.didSelected=@(YES);
            strongSelf.btnManus.enabled=YES;
        }else{
            strongSelf.didSelected=@(NO);
            strongSelf.btnManus.enabled=NO;
        }
        float price=[self.dryNum integerValue]*[[self.sourceData valueForKey:@"price"]  floatValue];
        
        strongSelf.lbPirce.text= [NSString stringWithFormat:@"￥ %.2f",price];
        [strongSelf.sourceData setValue:value forKey:@"drynumber"];
        return value;
    }]subscribeNext:^(id x) {}];
    
  
    //监听 selected
   [[ RACObserve(self, didSelected) map:^id(id value) {
        __strong DryCleaningCell *strongSelf=weakSelf;
       if ([value boolValue]) {
           strongSelf.contentView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1];
           
       }else{
           strongSelf.contentView.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
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
        
      [self numberManus];
      
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        [self numberAdd];
    }
}
-(void)numberAdd{
     self.dryNum=@([self.dryNum integerValue]+1);
}
-(void)numberManus{
    if ([self.dryNum integerValue]>0) {
        self.dryNum=@([self.dryNum integerValue]-1);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
