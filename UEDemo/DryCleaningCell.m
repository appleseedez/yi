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
    //监听 sourceData
     [[RACObserve(self, sourceData) map:^id(NSDictionary *value) {
         self.lbName.text=[value objectForKey:@"name"];
         self.lbDryPrice.text=[NSString stringWithFormat:@"干洗:%@",[value objectForKey:@"dryprice"]];
         self.lbIroningPrice.text=[NSString stringWithFormat:@"熨烫:%@",[value objectForKey:@"ironingprice"]];
         self.dryNum=[value objectForKey:@"drynumber"];
         self.ironNum=[value objectForKey:@"ironingnumber"];
         
         return value;
     }]subscribeNext:^(id x) {
         
     }];
    
    
    //监听 干洗数量
    [[RACObserve(self, dryNum) map:^id(NSNumber *value) {
        //熨烫数量不能超过干洗数量
        if ([self.ironNum integerValue]>[value integerValue]) {
            self.ironNum=value;
            }
        self.lbDryNum.text=[NSString stringWithFormat:@"%@",value];
        if ([value integerValue]>0) {
            self.didSelected=@(YES);
        }else{
            self.didSelected=@(NO);
        }
        [self.sourceData setValue:value forKey:@"drynumber"];
        return value;
    }]subscribeNext:^(id x) {
        
    }];
    //监听 熨烫数量
    [[RACObserve(self, ironNum) map:^id(NSNumber *value) {
        
        self.lbIronNum.text=[NSString stringWithFormat:@"%@",value];
        [self.sourceData setValue:value forKey:@"ironingnumber"];
        return value;
    }]subscribeNext:^(id x) {
        
    }];
    //监听 selected
   [[ RACObserve(self, didSelected) map:^id(id value) {
       if ([value boolValue]) {
           self.imgSelected.image=[UIImage imageNamed:@"selection_choosed"];
           
       }else{
           self.imgSelected.image=[UIImage imageNamed:@"selection_unchoosed"];
       }
       
       
       return value;
    }]subscribeNext:^(id x) {
        
    }];
    
    
    //干洗+1
    [[[self.btnAcDry rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
        NSInteger acDry= [self.dryNum integerValue];
        self.dryNum=@(acDry+1);
        return value;
    }]subscribeNext:^(id x) {
        
    }];
    
    [[[self.btnDeDry rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
            NSInteger acDry= [self.dryNum integerValue];
           if (acDry>0) {
               self.dryNum=@(acDry-1);
           }
           
           return value;
       }]subscribeNext:^(id x) {
           
       }];
    
    //熨烫
    [[[self.btnAcIron rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
        NSInteger acIron= [self.ironNum integerValue];
        if (acIron <[self.dryNum integerValue]) {
            self.ironNum=@(acIron+1);
        }
        
        return value;
    }]subscribeNext:^(id x) {
        
    }];
    [[[self.btnDeIron rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
        NSInteger deIron= [self.ironNum integerValue];
        if (deIron >0) {
            self.ironNum=@(deIron-1);
        }
        
        return value;
    }]subscribeNext:^(id x) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
