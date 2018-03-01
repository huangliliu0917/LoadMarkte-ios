//
//  RenZhengTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "RenZhengTableViewController.h"
#import "RenZhengModel.h"

@interface RenZhengTableViewController ()

@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,assign) int pageIndex;
@end

@implementation RenZhengTableViewController



- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(RenNew)] ;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadMoreData{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"authType"] = @(self.type);
    dict[@"pageIndex"] = @(++self.pageIndex);
    dict[@"pageSize"] = @(20);
    [HTNetworkingTool HTNetworkingToolPost:@"user/myInviteList" parame:dict isHud:NO success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            NSArray * data =  [RenZhengModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            [self.dataArray removeAllObjects];
            [self.dataArray addObjectsFromArray:data];
            [self.tableView reloadData];
        }
        
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}


- (void)RenNew{
    self.pageIndex = 1;
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"authType"] = @(self.type);
    dict[@"pageIndex"] = @(1);
    dict[@"pageSize"] = @(20);
    [HTNetworkingTool HTNetworkingToolPost:@"user/myInviteList" parame:dict isHud:NO success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            NSArray * data =  [RenZhengModel mj_objectArrayWithKeyValuesArray:json[@"data"][@"list"]];
            [self.dataArray removeAllObjects];
            [self.dataArray addObjectsFromArray:data];
            [self.tableView reloadData];
        }
        
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.dataArray.count) {
        [self.tableView dissmissEmptyView];
    }else{
        [self.tableView showEmptyViewClickImageViewBlock:^(id sender) {
            
        }];
    }
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxxxx" ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"xxxxx"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    RenZhengModel * model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.userName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"注册时间 %@",model.inviteTime];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
