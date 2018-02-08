//
//  OrderDetailTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderDetailTableViewController.h"
#import "OrderHeadView.h"
#import "OrderaViewFooter.h"
#import "OrderCreateModel.h"
#import <AlipaySDK/AlipaySDK.h>


@interface OrderDetailTableViewController ()<OrderaViewFooterDelegate>

@property(nonatomic,strong) OrderHeadView * orderView;

@property(nonatomic,strong) OrderaViewFooter * orderFooter;

@property(nonatomic,strong) PayInfo * order;

@end

@implementation OrderDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    self.navigationItem.title = @"订单详情";
    self.orderView = [[OrderHeadView alloc] init];
    self.orderView.frame = CGRectMake(0, 0, KScreenWidth, 93);
    self.tableView.tableHeaderView = self.orderView;
    
    self.orderFooter = [[OrderaViewFooter alloc] init];
    self.orderFooter.delegate = self;
    self.orderFooter.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(200));
    self.tableView.tableFooterView = self.orderFooter;
    
    self.tableView.backgroundColor = LWColor(241, 242, 243);
    
    if (self.orderModel) {
        [self getOrderInfo];
    }else{
       [self createOrder];
    }
    
}


- (void)getOrderInfo{
    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"orderId"] = self.orderModel.orderId;
    [HTNetworkingTool HTNetworkingToolPost:@"order/detail" parame:parame isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            PayInfo * order = [PayInfo mj_objectWithKeyValues:json[@"data"]];
            self.orderView.order = order;
            self.orderFooter.order = order;
            self.order = order;
            self.name = json[@"data"][@"name"];
            self.idCard = json[@"data"][@"idCardNo"];
            self.phone = json[@"data"][@"mobile"];
            [self.tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
    
}


- (void)createOrder{
    
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"mobile"] = self.phone;
    parame[@"name"] = self.name;
    parame[@"idCardNo"] = self.idCard;
    parame[@"tradeType"] = @(self.tradeType);
    parame[@"redirectUrl"] = @"baidu";
    [HTNetworkingTool HTNetworkingToolPost:@"order/create" parame:parame isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            PayInfo * order = [PayInfo mj_objectWithKeyValues:json[@"data"]];
            self.orderView.order = order;
            self.orderFooter.order = order;
            self.order = order;
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)lijizhifu:(int)upStatus andDownStatus:(int)downStatus {
    LWLog(@"ssssss");
//    if (!upStatus) {
//        [SVProgressHUD showErrorWithStatus:@"未同意征信查询授权"];
//        return;
//    }
//    if (!downStatus) {
//        [SVProgressHUD showErrorWithStatus:@""];
//        return;
//    }
    AppDelegate * dele =  (AppDelegate *)[UIApplication sharedApplication].delegate;
    dele.returnUrl = [self.order.bizParameters objectForKey:@"returnUrl"];
    //    if (bizPackage.length) {
    //self.order.bizParameters
    
    [[AlipaySDK defaultService] auth_V2WithInfo:[self.order.bizParameters objectForKey:@"bizPackage"]
                                     fromScheme:appScheme
                                       callback:^(NSDictionary *resultDic) {
                                           NSLog(@"result = AlipaySDK defaultService ======%@",resultDic);
                                           if([resultDic[@"resultStatus"] intValue] != 6001){
                                               PushWebViewController * pa = [[PushWebViewController alloc] init];
                                               pa.funUrl = [self.order.bizParameters objectForKey:@"returnUrl"];
                                               [self.navigationController pushViewController:pa animated:YES];
                                           }
                                       }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zhifubao"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"zhifubao"];
        cell.textLabel.font = kAdaptedFontSize(15);
        cell.detailTextLabel.font = kAdaptedFontSize(15);
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            if (self.tradeType == 3 || self.tradeType == 4) {
                cell.textLabel.text = (self.tradeType == 3 ? @"淘宝" : @"京东");
                //cell.detailTextLabel.text = self.name;
            }else{
                cell.textLabel.text = @"姓名";
                cell.detailTextLabel.text = self.name;
            }
           
        }else if(indexPath.row == 1){
           cell.textLabel.text = @"身份证号";
             cell.detailTextLabel.text = self.idCard;
        }else{
           cell.textLabel.text = @"手机号";
             cell.detailTextLabel.text = self.phone;
        }
        
    }else{
        cell.textLabel.text = @"支付宝";
    }
    return cell;
}



- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 30;
    }
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        UILabel * title = [[UILabel alloc] init];
        title.backgroundColor = LWColor(241, 242, 243);
        title.text = @"   查询主题信息";
        title.font = kAdaptedFontSize(13);
        title.frame = CGRectMake(0, 0, KScreenWidth, 20);
        return title;
    }else{
        UILabel * title = [[UILabel alloc] init];
        title.frame = CGRectMake(0, 0, KScreenWidth, 20);
        title.text = @"   支付方式";
        title.backgroundColor = LWColor(241, 242, 243);
        title.font = kAdaptedFontSize(13);
        return title;
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tradeType == 3 || self.tradeType == 4) {
        if (indexPath.row == 0) {
            return 50;
        }else{
            return 0;
        }
    }else{
        
        return 50;
    }
    
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return @"查询主题信息";
//}
//
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//
//    return @"支付方式";
//}
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
