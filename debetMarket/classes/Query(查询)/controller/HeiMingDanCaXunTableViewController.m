//
//  HeiMingDanCaXunTableViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HeiMingDanCaXunTableViewController.h"
#import "QueryHeadView.h"
#import "HeiMinCellTableViewCell.h"
#import "HeiMingDanFootView.h"
#import "OrderDetailTableViewController.h"

@interface HeiMingDanCaXunTableViewController ()

@property(nonatomic,strong) QueryHeadView * headView;

@property(nonatomic,strong) HeiMingDanFootView * footer;

@property(nonatomic,strong) NSArray * titleArray;

@property(nonatomic,strong) NSArray * titlePlaceArray;

@property(nonatomic,strong) NSMutableArray * cellArray;

@end

@implementation HeiMingDanCaXunTableViewController

- (NSMutableArray *)cellArray{
    if (_cellArray == nil) {
        _cellArray = [NSMutableArray array];
    }
    return _cellArray;
}

- (NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"hmName",@"hmId",@"hmsj"];
    }
    return _titleArray;
}

- (NSArray *)titlePlaceArray{
    if (_titlePlaceArray == nil) {
        _titlePlaceArray = @[@"请输入姓名",@"请输入身份证号",@"请输入手机号码"];
    }
    return _titlePlaceArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    if (self.cate == 0) {
        self.navigationItem.title = @"黑名单查询";
    }else{
        self.navigationItem.title = @"黑名单查询";
    }
    
    NSArray * titleArray;
    if (self.cate == 0) {
        if (self.type == 0) {
           self.navigationItem.title = @"行业黑名单";
        }else{
           self.navigationItem.title = @"金融黑名单";
        }
        titleArray = @[@"选择平台",@"查询主体",@"支付",@"查询结果"];
    }else if(self.cate == 1){
        self.navigationItem.title = @"运营商";
        titleArray = @[@"查询主体",@"支付",@"完善信息",@"查询结果"];
    }else{
        self.navigationItem.title = @"电商";
        titleArray = @[@"选择平台",@"支付",@"完善信息",@"查询结果"];
    }
    
    
    self.headView = [[QueryHeadView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(80)) andTitles:titleArray];
    self.headView.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.headView];
    self.tableView.tableHeaderView = self.headView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HeiMinCellTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HeiMinCellTableViewCell"];
    self.tableView.rowHeight = 50;
    self.footer = [[HeiMingDanFootView alloc] init];
    self.footer.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(200));
    self.tableView.tableFooterView = self.footer;
    self.footer.backgroundColor = [UIColor whiteColor];
    
    self.tableView.backgroundColor = LWColor(248, 247, 248);;
   
}


//下一步
- (void)nextStep{
    
    LWLog(@"xxxx");
    
    
    HeiMinCellTableViewCell * cell0 = [self.cellArray objectAtIndex:0];
    HeiMinCellTableViewCell * cell1 = [self.cellArray objectAtIndex:1];;
    HeiMinCellTableViewCell * cell2 = [self.cellArray objectAtIndex:2];;
    
    LWLog(@"%@",cell0.HeiMingTextField.text);
    LWLog(@"%@",cell1.HeiMingTextField.text);
    LWLog(@"%@",cell2.HeiMingTextField.text);
    
    if (!cell0.HeiMingTextField.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请填姓名"];
        return;
    }
    if (!cell1.HeiMingTextField.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请填身份证号"];
        return;
    }
    
    if (!cell2.HeiMingTextField.text.length) {
        [SVProgressHUD showErrorWithStatus:@"手机号"];
        return;
    }
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"name"] = cell0.HeiMingTextField.text;
    parame[@"idCardNum"] = cell1.HeiMingTextField.text;
    [HTNetworkingTool HTNetworkingToolPost:@"sesame/verifyIdAndName" parame:parame isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == 2000) {
            OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
            order.phone = cell2.HeiMingTextField.text;
            order.name = cell0.HeiMingTextField.text;
            order.idCard = cell1.HeiMingTextField.text;
            
            LWLog(@"%d----%d",self.cate,self.type);
            if (self.cate == 0 && self.type == 0) {
                order.tradeType = 0;
            }else if(self.cate == 0 && self.type == 1){
                order.tradeType = 1;
            }else if(self.cate == 1){
                order.tradeType = 2;
            }else if(self.cate == 2 && self.type == 0){
                order.tradeType = 3;
            }else{
                order.tradeType = 4;
            }
            [self.navigationController pushViewController:order animated:YES];
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error);
    }];
    
    
    

    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeiMinCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HeiMinCellTableViewCell"];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HeiMinCellTableViewCell" owner:nil options:nil] lastObject];
    }
    
    cell.iconView.image = [UIImage imageNamed:[self.titleArray objectAtIndex:indexPath.row]];
    cell.HeiMingTextField.placeholder = [self.titlePlaceArray objectAtIndex:indexPath.row];
    [self.cellArray addObject:cell];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    
    return 30.0f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * a = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    a.backgroundColor = LWColor(248, 247, 248);
    return a;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section

{
    UILabel * tile = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 20)];
    tile.textAlignment = NSTextAlignmentCenter;
    tile.backgroundColor = [UIColor clearColor];
    tile.text = @"* 以上信息用于确认您的身份";
    tile.font = kAdaptedFontSize(14);
    tile.backgroundColor = LWColor(248, 247, 248);
    return tile;
    
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
