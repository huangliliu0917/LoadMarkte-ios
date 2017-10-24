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

@interface MineViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *loginS;
@property (strong, nonatomic)  BackView * backBack;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人中心";
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LWLog(@"%@", indexPath);
    if (indexPath.section == 0) {
        
        
        
        LoginViewController * alet = [[LoginViewController alloc] init];
        [self.view.window addSubview:alet.view];
        
//        BackView * back = [[BackView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//        _backBack = back;
//        [back bk_whenTapped:^{
//            [back removeFromSuperview];
//        }];
//
////        [self.view addSubview:back];
//        [[UIApplication sharedApplication].keyWindow addSubview:back];
    }
}

@end
