//
//  StoreListViewController.m
//  UEDemo
//
//  Created by nsc on 14-6-9.
//  Copyright (c) 2014年 reactiveCocoa. All rights reserved.
//

#import "StoreListViewController.h"
#import "StoreListCell.h"
#import "AppService.h"
#import "MaoAppDelegate.h"
@interface StoreListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@end

@implementation StoreListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background"]];
    self.btnCancel.layer.borderColor=[UIColor whiteColor].CGColor;
    
    //self.navigationController.navigationBar.tintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background"]];;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)dismiss:(id)sender {
    [AppService defaultService].showStoreSetting=@(NO);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.storeList count];
}
- (IBAction)choose:(id)sender {
    if (self.choosedStore) {
       MaoAppDelegate *delegate= [UIApplication sharedApplication].delegate;
        delegate.currStore=[self.choosedStore copy];
        [[NSUserDefaults standardUserDefaults] setObject:[delegate.currStore objectForKey:@"id"] forKey:@"storeid"];
    }
    [self dismiss:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeListCell"];
    
    [cell setWithStore:[self.storeList objectAtIndex:indexPath.row]];
    cell.contextController=self;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
