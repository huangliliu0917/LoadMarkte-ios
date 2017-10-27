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
#import "ContentView.h"


@interface HomeViewController ()<HomeTopViewDelegate>

@property(nonatomic,strong) HomeTopView * homeTopView;
@property(nonatomic,strong) HotPublish * hotPublish;
@property(nonatomic,strong) ContentView * contenView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInit];
    
    


}

- (void)HomeTopView:(int)type{
    
    PushWebViewController *vc = [[PushWebViewController alloc] init];
    vc.funUrl = @"https://www.51nbapi.com/h5/login.html";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupInit{
    self.navigationItem.title = @"贷款超市";
    
    HomeTopView * homeTopView = [HomeTopView HomeTopViewFromXib];
    homeTopView.delegate = self;
    homeTopView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(170));
    self.homeTopView = homeTopView;
    [self.view addSubview:homeTopView];
    
    ContentView * contenView = [[ContentView alloc] init];
    self.contenView = contenView;
    [self.view addSubview:contenView];

    [self.contenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeTopView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
