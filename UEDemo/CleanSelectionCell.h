//
//  CleanSelectionCell.h
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderSelection.h"
@interface CleanSelectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak,nonatomic) OrderSelection *orderSelection;
@property (weak, nonatomic) IBOutlet UIImageView *imgChoosed;
@property (weak, nonatomic) IBOutlet UIView *seperatorView;

@end
