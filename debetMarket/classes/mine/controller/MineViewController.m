//
//  MineViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "MineViewController.h"
#import "BackView.h"
#include <UIView+BlocksKit.h>
#import "LoginViewController.h"

@interface MineViewController ()<LoginViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableViewCell *loginS;
@property (strong, nonatomic)  BackView * backBack;

@property (weak, nonatomic) IBOutlet UILabel *loginNameLable;

//@property (weak, nonatomic) UIViewController * LoginViewController;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人中心";
    
    
    self.loginNameLable.font = kAdaptedFontSize(20);
    
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    self.loginS.imageView.backgroundColor = [UIColor redColor];
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return 2;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return kAdaptedHeight(100);
    }else{
        return kAdaptedHeight(50);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LoginViewController * alet = [[LoginViewController alloc] init];
        alet.delegate = self;
        [self.view.window addSubview:alet.view];
    }else{
        if (indexPath.row == 0) {
            
            
        }else if(indexPath.row == 1){
            
            
        }else{
            
            SettingViewController * setVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
            [self.navigationController showViewController:setVC sender:nil];
        }
    }
}

/**
 * 登录成功通知
 **/
- (void)LOginViewResult:(HTViewController *)vc{
    UserInfo * user =  (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithFile:KeyedArchive(@"userInfo")];
    _loginNameLable.text = [user.realName copy];
    LWLog(@"xxxxx%@",[user mj_keyValues]);
}

@end
