//
//  SettingViewController.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/24.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "SettingViewController.h"
#import "SDImageCache.h"
@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cacheLable;
@property (weak, nonatomic) IBOutlet UILabel *versionLable;


@property (weak, nonatomic) IBOutlet UIButton *loginOutButton;

- (IBAction)loginOutButton:(id)sender;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    self.cacheLable.text = [self fileSizeWithInterge:[[SDImageCache sharedImageCache] getSize]];

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.versionLable.text = [NSString stringWithFormat:@"V%@",app_Version];
    
    self.navigationItem.title = @"设置";
    
    self.loginOutButton.layer.cornerRadius = 5;
    self.loginOutButton.layer.masksToBounds = YES;
    
    
}

//计算出大小
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LWLog(@"xxxx");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        UserRegisterViewController * uer = [[UserRegisterViewController alloc] init];
        uer.type = 1;
        [self.navigationController pushViewController:uer animated:YES];
    }
}

- (IBAction)loginOutButton:(id)sender {
    
    UIAlertController * alerc = [UIAlertController alertControllerWithTitle:@"退出账号" message:@"确定是否退出当前帐号" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alerc addAction:action1];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSFileManager defaultManager] removeItemAtPath:KeyedArchive(@"userInfo") error:nil];
//        [NSKeyedArchiver archiveRootObject:nil toFile:KeyedArchive(@"userInfo")];
        LoginViewController * uer = [[LoginViewController alloc] init];
        HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:uer];
        [self presentViewController:nav animated:YES completion:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        
    }];
    [alerc addAction:action2];
    
    [self presentViewController:alerc animated:YES completion:nil];
}
@end
