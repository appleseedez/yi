//
//  MaoQRToolViewController.m
//  UEDemo
//
//  Created by Zeug on 14-5-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoQRToolViewController.h"
#import "AppService.h"
@interface MaoQRToolViewController ()
@property(nonatomic) ZXCapture *capture;
@end

@implementation MaoQRToolViewController

#pragma mark - life
- (void)viewDidLoad {
  [super viewDidLoad];
  self.capture = [[ZXCapture alloc] init];
  self.capture.camera = self.capture.back;
  self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
  self.capture.rotation = 90.0f;

  self.capture.layer.frame = self.view.bounds;
  [self.view.layer addSublayer:self.capture.layer];
  self.scannerWin.layer.borderWidth = .5f;
  self.scannerWin.layer.borderColor = [[UIColor lightGrayColor] CGColor];
  [self.view bringSubviewToFront:self.scannerWin];
  [self.view bringSubviewToFront:self.decodedLabel];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  self.capture.delegate = self;
  self.capture.layer.frame = self.view.bounds;

  CGAffineTransform captureSizeTransform = CGAffineTransformMakeScale(
      320 / self.view.frame.size.width, 480 / self.view.frame.size.height);
  self.capture.scanRect =
      CGRectApplyAffineTransform(self.scannerWin.frame, captureSizeTransform);
}

#pragma mark - delegate
- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result {
  if (!result)
    return;
    if (![self.scanSuccess boolValue]) {
         self.scanSuccess = @(YES);
         NSLog(@"你妹的 扫出来了%@",result.text);
        [[AppService defaultService] showScanOrder:result.text];
       
    }
   
  // We got a result. Display information about the result onscreen.
//  NSString *formatString = [self barcodeFormatToString:result.barcodeFormat];
//  NSString *display =
//      [NSString stringWithFormat:@"Scanned!\nFormat: %@\nContents:\n%@",
//                                 formatString, result.text];
//  [self.decodedLabel performSelectorOnMainThread:@selector(setText:)
//                                      withObject:display
//                                   waitUntilDone:YES];
//  NSLog(@"code info :%@", formatString);
//  // Vibrate
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark - Private Methods
- (NSString *)barcodeFormatToString:(ZXBarcodeFormat)format {
  switch (format) {
  case kBarcodeFormatAztec:
    return @"Aztec";

  case kBarcodeFormatCodabar:
    return @"CODABAR";

  case kBarcodeFormatCode39:
    return @"Code 39";

  case kBarcodeFormatCode93:
    return @"Code 93";

  case kBarcodeFormatCode128:
    return @"Code 128";

  case kBarcodeFormatDataMatrix:
    return @"Data Matrix";

  case kBarcodeFormatEan8:
    return @"EAN-8";

  case kBarcodeFormatEan13:
    return @"EAN-13";

  case kBarcodeFormatITF:
    return @"ITF";

  case kBarcodeFormatPDF417:
    return @"PDF417";

  case kBarcodeFormatQRCode:
    return @"QR Code";

  case kBarcodeFormatRSS14:
    return @"RSS 14";

  case kBarcodeFormatRSSExpanded:
    return @"RSS Expanded";

  case kBarcodeFormatUPCA:
    return @"UPCA";

  case kBarcodeFormatUPCE:
    return @"UPCE";

  case kBarcodeFormatUPCEANExtension:
    return @"UPC/EAN extension";

  default:
    return @"Unknown";
  }
}
#pragma mark - action
- (void)navBack:(UIBarButtonItem *)sender {
}

- (void)fromPhotoLib:(UIBarButtonItem *)sender {
}
@end
