//
//  DryOrderCell.h
//  UEDemo
//
//  Created by nsc on 14-5-25.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DryOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbItemName;
@property (weak, nonatomic) IBOutlet UILabel *lbItemNum;
@property (weak, nonatomic) IBOutlet UILabel *lbItemPrice;

@end
