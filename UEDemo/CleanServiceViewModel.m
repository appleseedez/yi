//
//  CleanServiceViewModel.m
//  UEDemo
//
//  Created by nsc on 14-5-17.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanServiceViewModel.h"

@implementation CleanServiceViewModel
+(instancetype)serviceViewModelWithModel:(ServiceModel*)model{
    CleanServiceViewModel *viewModel=[CleanServiceViewModel new];
    viewModel.selections = model.PackSelections;
    viewModel.title=model.title;
    return viewModel;
    
}
@end
