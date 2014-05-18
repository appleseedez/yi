//
//  CleanTableViewCell.h
//  UEDemo
//
//  Created by nsc on 14-5-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CleanSectionModel;
@interface CleanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnSelected;
@property (weak, nonatomic)  CleanSectionModel *sectionModel;
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UIViewController *contextVC;
@end
