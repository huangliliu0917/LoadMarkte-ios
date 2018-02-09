//
//  OrderTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderTableViewController.h"
#import "OrderListTableViewCell.h"
#import "OrderModel.h"
#import "OrderDetailTableViewController.h"

@interface OrderTableViewController ()<shujumoheDelegate>

@property(nonatomic,strong) NSMutableArray * listArray;

@property(nonatomic,assign) int pageIndex;


@property(nonatomic,strong) OrderModel * orderModel;

@end

@implementation OrderTableViewController


- (NSMutableArray *)listArray{
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    self.pageIndex = 1;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    
    self.navigationItem.title = @"订单";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[OrderListTableViewCell class] forCellReuseIdentifier:@"OrderListTableViewCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.backgroundColor = LWColor(231, 232, 233);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadMoreData{
    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"pageIndex"] = @(++self.pageIndex);
    parame[@"pageSize"] = @"10";
    [HTNetworkingTool HTNetworkingToolPost:@"order/list" parame:parame isHud:NO success:^(id json) {
        LWLog(@"%@",parame);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000){
            NSArray * arr =  [OrderModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"] objectForKey:@"list"]];
            //[self.listArray removeAllObjects];
            [self.listArray addObjectsFromArray:arr];
            [self.tableView reloadData];
        }
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
    }];
    
}


- (void)loadNewData{
    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"pageIndex"] = @"1";
    self.pageIndex = 1;
    parame[@"pageSize"] = @"10";
    [HTNetworkingTool HTNetworkingToolPost:@"order/list" parame:parame isHud:NO success:^(id json) {
        LWLog(@"%@",parame);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000){
            NSArray * arr =  [OrderModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"] objectForKey:@"list"]];
            [self.listArray removeAllObjects];
            [self.listArray addObjectsFromArray:arr];
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if (self.listArray.count) {
        [self.tableView dissmissEmptyView];
    }else{
        [self.tableView showEmptyViewClickImageViewBlock:^(id sender) {
            
        }];
    }
    
    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderListTableViewCell"];
    if (cell == nil) {
        cell = [[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OrderListTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
    }
    // Configure the cell...
    cell.orderModel = [self.listArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.orderModel = [self.listArray objectAtIndex:indexPath.row];
    OrderModel * orderModel = [self.listArray objectAtIndex:indexPath.row];
    LWLog(@"%@",[orderModel mj_keyValues]);
    if ([orderModel.status intValue] == 1) {
        OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
        order.orderModel = orderModel;
        [self.navigationController pushViewController:order animated:YES];
    }else{
        if (orderModel.thirdAuthUrl && orderModel.thirdAuthUrl.length) {
            if ([orderModel.thirdAuthUrl rangeOfString:@"gh_credit://authTaobao"].location != NSNotFound) {
                [self openAfterthing:0];
            }else{
                PushWebViewController * vc =[[PushWebViewController alloc] init];
                vc.funUrl = orderModel.thirdAuthUrl;
                [self.navigationController pushViewController:vc animated:YES];
            }
            
        }
    }
    
}

/**
 Description
 @param type 0 淘宝  1 京东
 */
- (void)openAfterthing:(int)type{
    
    
    PBBaseReq *br = [PBBaseReq new];
    br.partnerCode=partner_code;//合作方code
    br.partnerKey = partner_key;//合作方key
    br.channel_code = @"005003";//授权渠道code
    /*
     基础设置
     如果不用自定义PBBaseSet，withBaseSet传nil
     如果只用某一个颜色、字体大小、图片，创建PBBaseSet对象，给相应颜色、字体大小、图片的对象即可.
     */
    PBBaseSet *set = [PBBaseSet new];
    //导航栏颜色
    set.navBGColor = AppMainColor;
    //导航栏标题颜色
    set.navTitleColor = [UIColor whiteColor];
    //导航栏标题字体
    set.navTitleFont = [UIFont systemFontOfSize:19];
    //导航栏按钮图片
    set.backBtnImage = [UIImage imageNamed:@"main_title_left_back"];
    
    [shujumohePB openPBPluginAtViewController:self withDelegate:self withReq:br withBaseSet:set];
    
}

- (void)thePBMissionWithCode:(NSString *)code withMessage:(NSString *)message{
    
    LWLog(@"%@---%@",code,message);
    if ([code intValue] == 0) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        dict[@"orderId"] = self.orderModel.orderId ;
        dict[@"taskId"] = message;
        [HTNetworkingTool HTNetworkingToolPost:@"carrier/saveTaskId" parame:nil isHud:YES success:^(id json) {
            LWLog(@"%@",json);
        } failure:^(NSError *error) {
        }];
        [SVProgressHUD showSuccessWithStatus:@"请求已提交，稍后在订单列表查看"];
    }else{
        //[self.navigationController popViewControllerAnimated:YES];
    }
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
