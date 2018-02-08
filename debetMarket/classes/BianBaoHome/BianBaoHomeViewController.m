//
//  BianBaoHomeViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "BianBaoHomeViewController.h"
#import "HeiMingViewController.h"

@interface BianBaoHomeViewController ()

@property(nonatomic,strong) UIImageView * topImageView;

@property(nonatomic,strong) UIImageView * centerImageView;

@property(nonatomic,strong) UIImageView * bottomImageView;

@end

@implementation BianBaoHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    __weak typeof(self) wself = self;
    CGFloat height =  KScreenWidth * 300.0 / 700;
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, height)];
    self.topImageView.image = [UIImage imageNamed:@"bbhmd"];
    [self.view addSubview:self.topImageView];
    self.topImageView.userInteractionEnabled = YES;
    [self.topImageView bk_whenTapped:^{
        [wself doClick:0];
    }];
    
    self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, KScreenWidth, height)];
    self.centerImageView.image = [UIImage imageNamed:@"bbds"];
    [self.view addSubview:self.centerImageView];
    self.centerImageView.userInteractionEnabled = YES;
    [self.centerImageView bk_whenTapped:^{
        [wself doClick:1];
    }];
    
    
    self.bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height * 2, KScreenWidth, height)];
    self.bottomImageView.image = [UIImage imageNamed:@"bbyys"];
    [self.view addSubview:self.bottomImageView];
    self.bottomImageView.userInteractionEnabled = YES;
    [self.bottomImageView bk_whenTapped:^{
        [wself doClick:2];
    }];
    
    self.view.backgroundColor = LWColor(241, 242, 243);
}


- (void)doClick:(int)type{
    if (type == 1) {
        HeiMingDanCaXunTableViewController * vc = [[HeiMingDanCaXunTableViewController alloc] initWithStyle:UITableViewStylePlain];
        vc.cate = 1;
        vc.type = 0;
        [self.navigationController pushViewController:vc animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
