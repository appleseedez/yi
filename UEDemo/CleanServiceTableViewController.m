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
@interface CleanServiceTableViewController ()

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
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CleanSectionModel *model=self.cleanViewModel.sections[section];
    if ([model.selected boolValue]) {
        return [model.selections count]+2;
    }
    
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CleanSectionModel *model=self.cleanViewModel.sections [indexPath.section];
    
    if (indexPath.row==0){
     CleanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanServiceCell"];
        cell.tableView=tableView;
        cell.lbTitle.text=model.title;
        
        cell.sectionModel=model;
        
        
        return cell;
    }else if(indexPath.section<5&&indexPath.row<[model.selections count]+1){
        CleanSelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanSelectionCell"];
        
        
        cell.lbTitle.text= [model.selections objectAtIndex:indexPath.row-1];
        return cell;
    }else if(indexPath.row>=[model.selections count]+1){
        CleanOrderCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CleanOrderCell"];
        return cell;
    }
    
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    if (indexPath.row==0) {
        return 57;
    
    }else {
        return 37;
    }
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
