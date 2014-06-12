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
#import "CleanOrderCell.h"
#import "CleanServiceCheckViewController.h"
#import "CleanService.h"
#import "CleanServiceViewModel.h"
#import "OrderSelection.h"
#import "CleanDetailCheckTableViewController.h"
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
        
        
        return cell;
    }else if(indexPath.row<[model.selections count]+1){
        CleanSelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanSelectionCell"];
        cell.orderSelection=[model.selections objectAtIndex:indexPath.row-1];
        
        cell.lbTitle.text= cell.orderSelection.name;
        return cell;
    }    
    return nil;
    
}
- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    if (indexPath.row==0) {
        return 44;
    
    }else {
        return 39;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ServiceModel *model=[self.cleanViewModel.service.serviceModels objectAtIndex:indexPath.section];
   
    if (indexPath.row==0) {
        
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
