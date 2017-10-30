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


/**热门列表*/
@property(nonatomic,strong) NSMutableArray * hotProjectList;

/**最新产品*/
@property(nonatomic,strong) NSMutableArray * newProjectList;

@end

@implementation HomeViewController



- (NSMutableArray *)hotProjectList{
    if (_hotProjectList == nil) {
        _hotProjectList = [NSMutableArray array];
    }
    return _hotProjectList;
}

- (NSMutableArray *)newProjectList{
    if (_newProjectList == nil) {
        _newProjectList = [NSMutableArray array];
    }
    return _newProjectList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInit];
    
    
    //获取首页数据
    [HTNetworkingTool HTNetworkingToolPost:@"project/index" parame:nil success:^(id json) {
        LWLog(@"%@",[json description]);
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            NSArray * hotProjectList =  [HomeListModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"]  objectForKey:@"hotProjectList"]];
            //[self.hotProjectList addObjectsFromArray:hotProjectList];
            NSArray * newProjectList =  [HomeListModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"]  objectForKey:@"newProjectList"]];
             //[self.newProjectList addObjectsFromArray:newProjectList];
            
            [self.contenView ContentViewSetDate:hotProjectList and:newProjectList];
            
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];

}

- (void)HomeTopView:(int)type{
    
    PushWebViewController *vc = [[PushWebViewController alloc] init];
    vc.funUrl = @"https://www.51nbapi.com/h5/login.html";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupInit{
    self.navigationItem.title = @"贷款超市";
    
    
//    self.homeTopHeight.constant = kAdaptedHeight(170);
//    self.homeTopView.delegate = self;
    
    HomeTopView * homeTopView = [HomeTopView HomeTopViewFromXib];
    homeTopView.delegate = self;
    homeTopView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(170));
    self.homeTopView = homeTopView;
    [self.view addSubview:homeTopView];
//
    
    
    
    ContentView * contenView = [[ContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(homeTopView.frame), KScreenWidth, KScreenHeight - 64)];
//    contenView.hotProjectList = self.hotProjectList;
//    contenView.NewListS = self.newProjectList;
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
