//
//  CleanServiceTableViewController.m
//  UEDemo
//
//  Created by nsc on 14-5-14.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "CleanServiceTableViewController.h"
#import "CleanViewModel.h"
#import "CleanTableViewCell.h"
#import "CleanSelectionCell.h"
#import "CleanSectionModel.h"

#import "CleanServiceCheckViewController.h"
#import "CleanService.h"
#import "CleanServiceViewModel.h"
#import "OrderSelection.h"
#import "CleanDetailCheckTableViewController.h"
#import "CleanWatchCell.h"
#import "CleanOrderDetailCell.h"
@interface CleanServiceTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSInteger selection;
@end

@implementation CleanServiceTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selection=200;
    self.cleanViewModel=[CleanViewModel new];
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.cleanViewModel.sections count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CleanSectionModel *model=self.cleanViewModel.sections[section];
    
    if ([model.selected boolValue]&&[model.selections count]) {
        return [model.selections count]+1;
    }
    
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CleanSectionModel *model=self.cleanViewModel.sections [indexPath.section];
    if (model.model.type==cleanServiceModelTypeStar) {
    
    if (model.indexPaths==nil) {
        model.indexPaths=[NSMutableArray new];
        [model.indexPaths addObject:indexPath];
    }else{
        NSIndexPath *oindex=model.indexPaths[0];
        if (oindex.section==indexPath.section &&indexPath.row!=0) {
            [model.indexPaths addObject:indexPath];
        }
    }
    
    if (indexPath.row==0){
     CleanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanServiceCell"];
        cell.tableView=tableView;
        cell.lbTitle.text=model.title;
        cell.contextVC=self;
        cell.sectionModel=model;
        NSString *imageName=nil;
        if ([model.model.numOfStar isEqualToString:@"1星"]) {
             imageName=@"clean_star_1";
        }else if ([model.model.numOfStar isEqualToString:@"2星"]) {
            imageName=@"clean_star_2";
        }else if ([model.model.numOfStar isEqualToString:@"3星"]) {
            imageName=@"clean_star_3";
        }else if ([model.model.numOfStar isEqualToString:@"4星"]) {
            imageName=@"clean_star_4";
        }else if ([model.model.numOfStar isEqualToString:@"5星"]) {
            imageName=@"clean_star_5";
        }
        cell.imgStar.image=[UIImage imageNamed:imageName];
        return cell;
    }else if(indexPath.row<[model.selections count]+1){
        CleanSelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanSelectionCell"];
        cell.orderSelection=[model.selections objectAtIndex:indexPath.row-1];
        
        cell.lbTitle.text= cell.orderSelection.name;
        return cell;
    }
    }else if (model.model.type==cleanServiceModelTypeWatch){
        CleanWatchCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cleanWatch"];
        cell.model=model.model;
        cell.controller=self;
        return cell;
    }else if (model.model.type==cleanServiceModelTypeOrder){
        
        CleanOrderDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cleanOrderDetail"];
        cell.controller=self;
        cell.model=model.model;
        return cell;
    }
    return nil;
    
}
- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    ServiceModel *model=[self.cleanViewModel.service.serviceModels objectAtIndex:indexPath.section];
    if (model.type==cleanServiceModelTypeStar) {
    
    if (indexPath.row==0) {
        return 46;
    
    }else {
        return 40;
    }
    }else if (model.type==cleanServiceModelTypeWatch){
        return 133;
    }else if (model.type==cleanServiceModelTypeOrder){
        return 60;
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ServiceModel *model=[self.cleanViewModel.service.serviceModels objectAtIndex:indexPath.section];
    if (model.type==cleanServiceModelTypeStar) {
     
    if (indexPath.row==0) {
        
        [self pushSubVCWithModel:model];
        
    }
    }else{
        [self pushSubVCWithModel:model];
    }
}
-(void) pushSubVCWithModel:(ServiceModel*)model{
    if (model.type==cleanServiceModelTypeStar) {
        CleanServiceCheckViewController *checkVC=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanServiceCheck"];
        
        CleanServiceViewModel *viewModel=[CleanServiceViewModel serviceViewModelWithModel:model];
        checkVC.serviceViewModel=viewModel;
        [self.navigationController pushViewController:checkVC animated:YES];
        
    }else if (model.type==cleanServiceModelTypeOrder){
        CleanDetailCheckTableViewController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"CleanDetailServiceCheck"];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
























@end
