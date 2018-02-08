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
#import "DebetDetailViewController.h"
#import "HeiMingViewController.h"

@interface HomeViewController ()<HomeTopViewDelegate,ContentViewDelegate>

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

//- (void)getInit{
//    //获取首页数据
//    UserInfo * user =  (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
//    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
//    if (user == nil) {
//        parame[@"userId"] = user.userId;
//    }else{
//        parame[@"userId"] = @(0);
//    }
//    [HTNetworkingTool HTNetworkingToolPost:@"user/init" parame:parame isHud:YES  success:^(id json) {
//        LWLog(@"%@",[json description]);
//
//    } failure:^(NSError *error) {
//        LWLog(@"%@",[error description]);
//    }];
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInit];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    self.navigationItem.title = @"首页";
    //[self getInit];
    
    [self getHomeDate];

}

- (void)getHomeDate{
    
    //获取首页数据
    [SVProgressHUD showWithStatus:nil];
    [HTNetworkingTool HTNetworkingToolPost:@"project/index" parame:nil isHud:NO  success:^(id json) {
        LWLog(@"%@",json);
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            NSArray * hotProjectList =  [HomeListModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"]  objectForKey:@"hotProjectList"]];
            //[self.hotProjectList addObjectsFromArray:hotProjectList];
            NSArray * newProjectList =  [HomeListModel mj_objectArrayWithKeyValuesArray:[[json objectForKey:@"data"]  objectForKey:@"newProjectList"]];
            //[self.newProjectList addObjectsFromArray:newProjectList];
            [self.contenView ContentViewSetDate:hotProjectList and:newProjectList];
            
        }
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self getHomeDate];
        });
        
        LWLog(@"%@",[error description]);
    }];
}

- (void)HomeTopView:(int)type{

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

- (void)setupInit{
    self.navigationItem.title = AppName;
    
    
//    self.homeTopHeight.constant = kAdaptedHeight(170);
//    self.homeTopView.delegate = self;
    
    HomeTopView * homeTopView = [HomeTopView HomeTopViewFromXib];
    homeTopView.delegate = self;
    
    LWLog(@"%f-----%f",KScreenHeight,KScreenWidth);
    LWLog(@"%f-----%f",kScreenHeightRatio,kAdaptedHeight(170));
    homeTopView.frame = CGRectMake(0, 0, KScreenWidth, kAdaptedHeight(180));
    self.homeTopView = homeTopView;
    [self.view addSubview:homeTopView];
//
    
    
    
//    ContentView * contenView = [[ContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(homeTopView.frame), KScreenWidth, KScreenHeight - 64)];
//    contenView.hotProjectList = self.hotProjectList;
//    contenView.NewListS = self.newProjectList;
    
    ContentView * contenView = [[ContentView alloc] initWithFrame:CGRectZero];
    self.contenView = contenView;
    [self.view addSubview:contenView];
    contenView.delegate = self;
    [self.contenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeTopView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(0);
    }];
    
    
}

- (void)seeMore{
    
    [self.tabBarController setSelectedIndex:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ContentViewDelegate:(HomeListModel *)model{
    
    DebetDetailViewController * debetDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DebetDetailViewController"];
//    HomeListModel * model = [self.listData objectAtIndex:indexPath.row];
    debetDetailViewController.model = model;
    [self.navigationController pushViewController:debetDetailViewController animated:YES];
}
@end
