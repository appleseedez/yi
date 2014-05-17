//
//  CheckViewCell.h
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderSelection.h"
@interface CheckViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheckBox;
@property (weak, nonatomic) OrderSelection *orderSelection;
@end
