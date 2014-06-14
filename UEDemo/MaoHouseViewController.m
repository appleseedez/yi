//
//  MaoHouseViewController.m
//  UEDemo
//
//  Created by Zeug on 14-5-19.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "MaoHouseViewController.h"
#import "AppService.h"
#import "HouseViewModel.h"
#import "CommetCell.h"
@interface MaoHouseViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnScan;
@property (weak, nonatomic) IBOutlet UIView *imgBorderView;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UILabel *txtStoreName;
@property (weak, nonatomic) IBOutlet UILabel *txtServiceconcept;
@property (weak, nonatomic) IBOutlet UILabel *txtServicetenets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@end

@implementation MaoHouseViewController
- (void)dismissPage:(UIBarButtonItem *)cancel {
  [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.houseViewModel = [[HouseViewModel alloc]init];
    [self.houseViewModel loadStore];
    [self.houseViewModel loadCommets];
    //监听HUD
    [[ RACObserve(self, houseViewModel.busy) map:^id(NSNumber *value) {
        if ([value boolValue]) {
            MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.labelText=@"请稍后";
            
        }else{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }
        
        
        return value;
    }]subscribeNext:^(id x) {}];
    //监听 详细信息
   [[ RACObserve(self, houseViewModel.store) map:^id(NSDictionary *value) {
       if (value) {
           self.txtServiceconcept.text=[value objectForKey:@"serviceconcept"];
           self.txtServicetenets.text=[value objectForKey:@"servicetenets"];
           self.txtStoreName.text=[value objectForKey:@"name"];

       }
       
       
        return value;
    }]subscribeNext:^(id x) {}];
    
    //监听 加载评论
    [[ RACObserve(self, houseViewModel.commets) map:^id(NSDictionary *value) {
        if (value) {
            [self.tableView reloadData];
        }
        
        
        return value;
    }]subscribeNext:^(id x) {}];
    
    [self.btnBack addTarget:self action:@selector(dismissPage:) forControlEvents:UIControlEventTouchUpInside];
    [self setUI];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
    [self becomeFirstResponder];
}
-(void)setUI{
//    self.btnBack.clipsToBounds=YES;
//    [self.btnBack.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [self.btnBack.layer setBorderWidth:1];
//    
//
//    
//    self.btnScan.clipsToBounds=YES;
//    [self.btnScan.layer setBorderColor:[UIColor whiteColor].CGColor];
//    [self.btnScan.layer setBorderWidth:1];
   
    
    self.imgBorderView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.imgBorderView.clipsToBounds=YES;
    self.imgBorderView.layer.borderWidth=1.0;
    self.imgBorderView.backgroundColor=[UIColor clearColor];
    self.imgBorderView.layer.cornerRadius=self.imgBorderView.frame.size.height/2.0;
    
    self.imgLogo.layer.cornerRadius=self.imgLogo.frame.size.height/2.0;
    self.imgLogo.clipsToBounds=YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.houseViewModel.commets count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommetCell *cell=[tableView dequeueReusableCellWithIdentifier:@"commetCell"];
    NSDictionary *dic=[self.houseViewModel.commets objectAtIndex:indexPath.row];
    [cell loatCommet:dic];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"有媳妇的都抱稳了 我要开始摇了！！！");
    
}



- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    NSLog(@"我勒个去 没摇出来 进入要饭模式！！！");
    //摇动取消
    
}



- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event

{
    
    //摇动结束
     NSLog(@"摇出来了！！！进入装B模式！！！");
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        [AppService defaultService].showStoreSetting=@(YES);
        //[[AppService defaultService]getLocation];
        
    }
    
}
@end
