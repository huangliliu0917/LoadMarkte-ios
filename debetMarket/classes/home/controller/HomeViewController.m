//
//  ViewController.m
//  debetMarket
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTopView.h"
#import "HotPublish.h"

@interface HomeViewController ()

@property(nonatomic,strong) HomeTopView * homeTopView;
@property(nonatomic,strong) HotPublish * hotPublish;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupInit];
    //[self.navigationController.navigationBar setHidden:YES];
    //版本检查
    //[[HTCheckVersionTool sharedCheckManager] checkVersion:self];
    
    //[UISceenn mainScreen].siz
    //定位
//    [[MyCoreLocation MyCoreLocationShare] MyCoreLocationStartLocal:self];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)setupInit{
    self.navigationItem.title = @"贷款超市";
    
    

    HomeTopView * homeTopView = [HomeTopView HomeTopViewFromXib];
    homeTopView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(170));
    self.homeTopView = homeTopView;
    [self.view addSubview:homeTopView];
    
    HotPublish * hotPublish = [HotPublish HotPublishViewCreate];
    self.hotPublish = hotPublish;
    [self.view addSubview:hotPublish];
    [self.hotPublish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeTopView.mas_bottom).mas_offset(kAdaptedHeight(8));
        make.right.equalTo(self.homeTopView.mas_right);//.offset(kAdaptedWidth(-15));
        make.left.equalTo(self.homeTopView.mas_left);
        make.height.mas_equalTo(50);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
