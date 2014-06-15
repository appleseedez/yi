//
//  ShareService.h
//  UEDemo
//
//  Created by nsc on 14-6-15.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "BaseViewModel.h"

@interface ShareService : BaseViewModel
+(instancetype)defautService;
-(void)shareWithTitle:(NSString*)title content:(NSString*)content type:(NSString*)type;
@end
