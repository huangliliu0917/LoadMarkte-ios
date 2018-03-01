//
//  BianBaoHomeViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BianBaoHomeViewController.h"
#import "HeiMingViewController.h"
#import "ChaXunList.h"


@interface BianBaoHomeViewController ()

@property(nonatomic,strong) UIImageView * topImageView;

@property(nonatomic,strong) UIImageView * centerImageView;

@property(nonatomic,strong) UIImageView * bottomImageView;

@property(nonatomic,assign) int packageType;


@property(nonatomic,strong) ChaXunList * industry;

@property(nonatomic,strong) ChaXunList * finance;

@property(nonatomic,assign) int type;

@end

@implementation BianBaoHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    self.type = 0;
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    self.packageType = delegate.packageType;
    
    __weak typeof(self) wself = self;
    CGFloat height =  KScreenWidth * 300.0 / 700;
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, height)];
    self.topImageView.image = [UIImage imageNamed:@"bbhmd"];
    [self.view addSubview:self.topImageView];
    self.topImageView.userInteractionEnabled = YES;
    [self.topImageView bk_whenTapped:^{
        //[wself doClick:0];
    }];
    
    
    self.industry = [[ChaXunList alloc] init];
    self.industry.userInteractionEnabled = YES;
    //self.industry.cate = self.type;
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
        make.top.mas_equalTo(self.topImageView.mas_bottom).mas_offset(kAdaptedHeight(20));
        make.height.mas_equalTo(kAdaptedHeight(80));
    }];
    
    self.finance = [[ChaXunList alloc] init];
    [self.view addSubview:self.finance];
    //self.finance.cate = self.type;
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
    
    
    
    
//    self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, KScreenWidth, height)];
//    self.centerImageView.image = [UIImage imageNamed:@"bbyys"];
//    [self.view addSubview:self.centerImageView];
//    self.centerImageView.userInteractionEnabled = YES;
//    [self.centerImageView bk_whenTapped:^{
//        [wself doClick:1];
//    }];
//
//
//    self.bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height * 2, KScreenWidth, height)];
//    self.bottomImageView.image = [UIImage imageNamed:@"bbds"];
//    [self.view addSubview:self.bottomImageView];
//    self.bottomImageView.userInteractionEnabled = YES;
//    [self.bottomImageView bk_whenTapped:^{
//        [wself doClick:2];
//    }];
    
    self.view.backgroundColor = LWColor(241, 242, 243);
}


- (void)doClick:(int)type{
    if (type == 1) {
        if (self.packageType == 0) {
            [[HTTool HTToolShare] showAlertWithController:self andTitle:@"允许\"过海征信\"使用数据" andMessage:@"本次征信查询信息，只供用户本人查看。本公司承诺为之保密不外泄" conform:^{
                HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
                vc.cate = 1;
                vc.type = 0;
                [self.navigationController pushViewController:vc animated:YES];
            } cancle:^{

            }];
        }else{
            HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
            vc.cate = 1;
            vc.type = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
        
    }else{
        HeiMingViewController * vc = [[HeiMingViewController alloc] init];
        vc.type = type;
        [self.navigationController pushViewController:vc animated:YES];
    }
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
        
        
        //OrderDetailTableViewController * order = [[OrderDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
        //order.tradeType = (type == 0 ? 3 : 4);
        //[self.navigationController pushViewController:order animated:YES];
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
