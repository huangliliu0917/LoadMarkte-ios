//
//  ZhengXingViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "ZhengXingViewController.h"
#import "ZhengXingHeadView.h"



@interface ZhengXingViewController ()

@property (strong, nonatomic) ZhengXingHeadView * headView;

@property (nonatomic,strong) NSArray * titleArray;


@end

@implementation ZhengXingViewController


- (NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"行业黑名单详情",@"金融黑名单详情",@"运营商详情",@"淘宝详情",@"京东详情"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    self.headView.frame = CGRectMake(0, kNavigationBar_HEIGHT, KScreenWidth, kAdaptedHeight(200));
    self.headView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = self.headView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"zhengxingBaogao"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"zhengxingBaogao"];
    }
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}



@end
