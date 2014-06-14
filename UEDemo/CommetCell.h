//
//  CommetCell.h
//  UEDemo
//
//  Created by nsc on 14-6-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbCommet;
-(void)loatCommet:(NSDictionary*)data;
@end
