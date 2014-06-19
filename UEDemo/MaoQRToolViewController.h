//
//  MaoQRToolViewController.h
//  UEDemo
//
//  Created by Zeug on 14-5-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomAlertWindow.h"
@interface MaoQRToolViewController : UIViewController <ZXCaptureDelegate,CustomAlertWindowDelegate>
@property(nonatomic, weak) IBOutlet UIView *scannerWin;
@property(nonatomic, weak) IBOutlet UILabel *decodedLabel;
- (IBAction)navBack:(UIBarButtonItem *)sender;
- (IBAction)fromPhotoLib:(UIBarButtonItem *)sender;
@property (nonatomic) NSNumber *scanSuccess;
@end
