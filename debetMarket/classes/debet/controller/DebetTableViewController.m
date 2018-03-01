//
//  DebetTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "DebetTableViewController.h"
#import "HeadIconView.h"
#import "ContentTableViewCell.h"
#import "DebetDetailViewController.h"
#import "UIView+EaseBlankPage.h"
@interface DebetTableViewController ()<UITableViewDelegate,UITableViewDataSource,HeadIconViewDelegate>

@property(nonatomic,strong) HeadIconView * head;

@property(nonatomic,strong) UITableView * content;

@property(nonatomic,strong) NSMutableArray  * headData;

@property(nonatomic,strong) NSMutableArray  * listData;


@property(nonatomic,assign) NSInteger pageIndex;

@property (nonatomic,strong) CateGoryModel * currentCategray;


@property (nonatomic,assign) bool isUpPull;

@end

@implementation DebetTableViewController



- (NSMutableArray *)listData{
    if (_listData == nil) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}

- (NSMutableArray *)headData{
    if(_headData == nil){
        _headData = [NSMutableArray array];
    }
    return _headData;
}


/**
 *  头部分类点击
 **/
- (void)HeadIconClick:(CateGoryModel *)model
{
    LWLog(@"%@",[model mj_keyValues
                 ]);
    self.pageIndex = 0;
    self.isUpPull = false;
    _currentCategray = model;
    [self.listData removeAllObjects];
    [self getListWithCateGray:model];
}

- (void)addMore{
    //self.pageIndex += 1;
    self.isUpPull = YES;
    [self getListWithCateGray:self.currentCategray];
}



//下拉刷新
- (void)getListWithCateGray:(CateGoryModel *)model{
    LWLog(@"%@",[model mj_keyValues]);
    NSMutableDictionary * parame  = [NSMutableDictionary dictionary];
    parame[@"categoryId"] = model == nil ? @(0) : @(model.categoryId);
    parame[@"pageIndex"] = @(++self.pageIndex);
    parame[@"pageSize"] = @(10);
    parame[@"topNum"] = @(0);
    parame[@"isHot"] = @(-1);
    parame[@"isNew"] = @(-1);
    [SVProgressHUD showWithStatus:nil];
    LWLog(@"%@",parame);
    [HTNetworkingTool HTNetworkingToolPost:@"project/list" parame:parame isHud:NO  success:^(id json) {
        LWLog(@"%@",[json description]);
        
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            NSArray * data = [HomeListModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"] objectForKey:@"list"]];
            LWLog(@"%ld",(long)self.pageIndex);
            if (!self.isUpPull) {
                [self.listData removeAllObjects];
            }
            [self.listData addObjectsFromArray:data];
            //self.pageIndex = [[[json objectForKey:@"data"] objectForKey:@"pageIndex"] integerValue];
            LWLog(@"%ld",(long)self.pageIndex);
            [self.tableView reloadData];
        }
        //[self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        LWLog(@"%@",[error description]);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self getListWithCateGray:_currentCategray];
        });
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"贷款";
    self.head = [[HeadIconView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0)];
    self.head.delegate = self;
    self.tableView.tableHeaderView = self.head;
//    self.head.backgroundColor = LWColor(236, 36, 43);
    //[self.view addSubview:self.head];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    self.pageIndex = 0;
    self.isUpPull = false;
    
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ContentTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"productCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self loadNewData];
    
    MJRefreshNormalHeader * head = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(addMore)];
    self.tableView.mj_header = head;
    self.tableView.mj_footer = footer;
   //[self.tableView.mj_header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.headData.count) {
        [self.tableView.mj_header beginRefreshing];
    }
    
}

//huo
- (void)loadNewData{
    
    self.pageIndex = 0;
    self.isUpPull = false;
    [HTNetworkingTool HTNetworkingToolPost:@"project/categories" parame:nil isHud:NO success:^(id json) {
        
         LWLog(@"%@",json);
        if([[json objectForKey:@"resultCode"] intValue] == 2000){
            NSArray * data =  [CateGoryModel mj_objectArrayWithKeyValuesArray:[json objectForKey:@"data"][@"list"]];
            [self.headData addObjectsFromArray:data];
            self.head.dataArray = [NSMutableArray arrayWithArray:data];
            CGFloat height = data.count == 0? 0 : (((data.count - 1)  / 4 + 1) * (KScreenWidth - 50) * 0.25) + ((data.count / 4 + 1) + 1) * 5;
            CGRect frame =  self.head.frame;
            frame.size.height = height;
            self.head.frame = frame;
            //_currentCategray = [data firstObject];
            [self getListWithCateGray:nil];
            
        }
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self loadNewData];
        });
        LWLog(@"%@",[error description]);
    }];
    
}


//- (void)viewWillAppear:(BOOL)animated{
//
//    [super viewWillAppear:animated];
//
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LWLog(@"%lu",(unsigned long)self.listData.count);
    return self.listData.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * slider = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    slider.backgroundColor = LWColor(241, 242, 243);
    return slider;


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContentTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    if (cell == nil) {
        cell = (ContentTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"ContentTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    HomeListModel * model = [self.listData objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DebetDetailViewController * debetDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DebetDetailViewController"];
    HomeListModel * model = [self.listData objectAtIndex:indexPath.row];
    debetDetailViewController.model = model;
    [self.navigationController pushViewController:debetDetailViewController animated:YES];
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

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}
@end
