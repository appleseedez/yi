//
//  StarView.h
//  UEDemo
//
//  Created by nsc on 14-6-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
@property  NSNumber *score;
@property NSMutableArray *stars;
-(void)loadStars:(CGFloat)starSize;
-(void)setNewScore:(int)score;
@end
