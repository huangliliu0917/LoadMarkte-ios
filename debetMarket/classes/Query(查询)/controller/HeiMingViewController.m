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

@property(nonatomic,assign) int packageType;

@end

@implementation HeiMingViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    self.packageType = delegate.packageType;
    
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
    [self.industry bk_whenTapped:^{ // 第一个
        LWLog(@"xxxxxxxxxxxx");
        
        
        [wself UserGrant:0];
        
//        if (wself.type == 0) {
//            //行业黑名单
//            HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
//            vc.cate = self.type;
//            vc.type = 0;
//            [wself.navigationController pushViewController:vc animated:YES];
//        }else{ // 电商的
//            OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
//            order.tradeType = 3;
//            [wself.navigationController pushViewController:order animated:YES];
//        }
        
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
    [self.finance bk_whenTapped:^{ // 第二个
        [wself UserGrant:1];
//        if (wself.type == 0) {
//            HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
//            vc.cate = self.type;
//            vc.type = 1;
//            [wself.navigationController pushViewController:vc animated:YES];
//        }else{
//            OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
//            order.tradeType = 4;
//            [wself.navigationController pushViewController:order animated:YES];
//        }
        
    }];
    
    self.view.backgroundColor = LWColor(232, 233, 234);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)doNextSet:(int)type{
    if (self.type == 0) {
        //行业黑名单
        HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
        vc.cate = self.type;
        vc.type = type;
        [self.navigationController pushViewController:vc animated:YES];
    }else{ // 电商的
        
        
        OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
        order.tradeType = (type == 0 ? 3 : 4);
        [self.navigationController pushViewController:order animated:YES];
    }
}

/**
 用户授权同意 0 第一个  1 是第二个
 */
- (void)UserGrant:(int)type{
    
    if (self.packageType == 0) {
        [[HTTool HTToolShare] showAlertWithController:self andTitle:@"允许\"过海征信\"使用数据" andMessage:@"本次征信查询信息，只供用户本人查看。本公司承诺为之保密不外泄" conform:^{
            [self doNextSet:type];
        } cancle:^{
            
        }];
    }else{
       [self doNextSet:type];
    }
    
}

@end
