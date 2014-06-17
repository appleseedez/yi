//
//  StarView.m
//  UEDemo
//
//  Created by nsc on 14-6-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "StarView.h"
#define STAR_TAG 10086
@implementation StarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}
-(void)loadStars:(CGFloat)starSize{
    self.stars=[NSMutableArray new];
    CGFloat width=self.frame.size.width/5.0;
    for (int i=0; i<5; i++) {
        UIButton *star=[[UIButton alloc]init];
        star.frame=CGRectMake(i*width, 0, starSize, starSize);
        star.tag=STAR_TAG + i;
        [self addSubview:star];
        [self.stars addObject:star];
        [star addTarget:self action:@selector(refreshScore:) forControlEvents:UIControlEventTouchDown];
        star.adjustsImageWhenHighlighted=NO;
        if (i<=[self.score intValue]) {
            [star setBackgroundImage:[UIImage imageNamed:@"share_star_shining"] forState:UIControlStateNormal];
            
        }else{
            [star setBackgroundImage:[UIImage imageNamed:@"share_star_dark"] forState:UIControlStateNormal];
        }
    }
}
-(void)refreshScore:(UIButton*)sender{
    int score= [self.stars indexOfObject:sender];
    [self setNewScore:score];
    
}
-(void)setNewScore:(int)score{
    for (UIButton *star in self.stars) {
        int i= [self.stars indexOfObject:star];
        if (i<=score) {
            [star setBackgroundImage:[UIImage imageNamed:@"share_star_shining"] forState:UIControlStateNormal];
        }else{
            [star setBackgroundImage:[UIImage imageNamed:@"share_star_dark"] forState:UIControlStateNormal];
        }
    }
    self.score=@(score);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
