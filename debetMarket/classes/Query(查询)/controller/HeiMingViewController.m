//
//  HeiMingViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HeiMingViewController.h"
#import "QueryHeadView.h"
#import "ChaXunList.h"
#import "HeiMingDanCaXunTableViewController.h"
#import "OrderDetailTableViewController.h"


@interface HeiMingViewController ()

@property(nonatomic,strong) QueryHeadView * headView;

@property(nonatomic,strong) ChaXunList * industry;

@property(nonatomic,strong) ChaXunList * finance;


@end

@implementation HeiMingViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    LWLog(@"%d",self.type);
    
    NSArray * titleArray;
    
    if (self.type == 0) {
        self.navigationItem.title = @"黑名单";
        titleArray = @[@"选择平台",@"查询主体",@"支付",@"查询结果"];
    }else if(self.type == 1){
        self.navigationItem.title = @"运营商";
        titleArray = @[@"查询主体",@"支付",@"完善信息",@"查询结果"];
    }else{
        self.navigationItem.title = @"电商";
        titleArray = @[@"选择平台",@"支付",@"完善信息",@"查询结果"];
    }
    
    self.headView = [[QueryHeadView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(80)) andTitles:titleArray];
    self.headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headView];
    
    __weak typeof(self) wself = self;
    self.industry = [[ChaXunList alloc] init];
    self.industry.userInteractionEnabled = YES;
    self.industry.cate = self.type;
    self.industry.type = 0;
    [self.view addSubview:self.industry];
    [self.industry bk_whenTapped:^{
        LWLog(@"xxxxxxxxxxxx");
        
        if (wself.type == 0) {
            HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
            vc.cate = self.type;
            vc.type = 0;
            [wself.navigationController pushViewController:vc animated:YES];
        }else{
            OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
            order.tradeType = 3;
            [wself.navigationController pushViewController:order animated:YES];
        }
        
    }];
    self.industry.backgroundColor = LWColor(233, 97, 2);
    [self.industry mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(kAdaptedWidth(10));
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-kAdaptedWidth(10));
        make.top.mas_equalTo(self.headView.mas_bottom).mas_offset(kAdaptedHeight(20));
        make.height.mas_equalTo(kAdaptedHeight(80));
    }];
    
    self.finance = [[ChaXunList alloc] init];
    [self.view addSubview:self.finance];
    self.finance.cate = self.type;
    self.finance.type = 1;
    self.finance.userInteractionEnabled = YES;
    self.finance.backgroundColor = LWColor(213, 29, 26);
    [self.finance mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left).mas_offset(kAdaptedWidth(10));
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-kAdaptedWidth(10));
        make.top.mas_equalTo(self.industry.mas_bottom).mas_offset(kAdaptedHeight(20));
        make.height.mas_equalTo(kAdaptedHeight(80));
    }];
    [self.finance bk_whenTapped:^{
        
        if (wself.type == 0) {
            HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
            vc.cate = self.type;
            vc.type = 1;
            [wself.navigationController pushViewController:vc animated:YES];
        }else{
            OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
            order.tradeType = 4;
            [wself.navigationController pushViewController:order animated:YES];
        }
        
    }];
    
    self.view.backgroundColor = LWColor(232, 233, 234);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
