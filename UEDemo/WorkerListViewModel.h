//
//  WorkerListViewModel.h
//  UEDemo
//
//  Created by nsc on 14-5-18.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkerListViewModel : NSObject
@property (nonatomic) NSArray *workerList;
-(void)loadWorkerList;
@end
