//
//  WorkerListViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface WorkerListViewModel : BaseViewModel
@property (nonatomic) NSArray *workerList;
@property (nonatomic) NSNumber *orderSuccess;
-(void)loadWorkerList;
-(void)subWorkerOrder;
@end
