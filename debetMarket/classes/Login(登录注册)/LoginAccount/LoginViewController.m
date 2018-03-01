//
//  LoginViewController.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "LoginViewController.h"



@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *loginIconView;


@property (weak, nonatomic) IBOutlet UITextField *loginPhone;
@property (weak, nonatomic) IBOutlet UITextField *password;



/**
 忘记密码
 */
@property (weak, nonatomic) IBOutlet UILabel *forgetPasswd;



/**
 登录
 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


/**
 用户注册
 */
@property (weak, nonatomic) IBOutlet UIButton * UserRegist;

/**
 我是借款人
 */
@property (weak, nonatomic) IBOutlet UILabel *woShiJIekuanRen;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImageLength;

@end

@implementation LoginViewController



/**
 新用户注册

 @param sender 按钮
 */
- (IBAction)registClick:(id)sender {
    
    UserRegisterViewController * uer = [[UserRegisterViewController alloc] init];
    //HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:uer];
    [self.navigationController pushViewController:uer animated:YES];
            //[self presentViewController:nav animated:YES completion:nil];
}




- (void)setUpUI{
    
    self.loginBtn.backgroundColor = AppMainColor;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    self.navigationItem.title = @"账号";
    
    
    //self.woShiJIekuanRen.attributedText = [@"我是借款人" StringBackUnderLine];
    self.woShiJIekuanRen.font = kAdaptedFontSize(14);
    self.woShiJIekuanRen.userInteractionEnabled = YES;
    __weak typeof(self) wself = self;
   
    //点击
    NSString * url =  [[NSUserDefaults standardUserDefaults] objectForKey:@"qrcodeLink"];
    [self.woShiJIekuanRen bk_whenTapped:^{
        PushWebViewController * pc = [[PushWebViewController alloc] init];
        pc.funUrl = url;
        [wself.navigationController pushViewController:pc animated:YES];
    }];
    
//    self.forgetPasswd.attributedText = [@"忘记密码?" StringBackUnderLine];
    self.forgetPasswd.font = kAdaptedFontSize(14);
    self.UserRegist.layer.cornerRadius = 5;
    self.UserRegist.layer.masksToBounds = YES;
    self.UserRegist.layer.borderWidth = 1;
    self.UserRegist.layer.borderColor = LWColor(218, 218, 218).CGColor;
    
    
    self.forgetPasswd.userInteractionEnabled = YES;
    self.UserRegist.userInteractionEnabled = YES;
    
    self.topImageLength.constant = kAdaptedHeight(80);
    [self.forgetPasswd bk_whenTapped:^{
        UserRegisterViewController * uer = [[UserRegisterViewController alloc] init];
        uer.type = 1;
        [self.navigationController pushViewController:uer animated:YES];
    }];
//
//
//
    self.loginIconView.layer.cornerRadius = 10;
    self.loginIconView.layer.masksToBounds = YES;

    LWLog(@"%@",AppIconName);
    self.loginIconView.image = [UIImage imageNamed:AppIconName];
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //隐藏导航栏
    //self.navigationController.navigationBarHidden = YES;
    
    [[HTTool HTToolShare] HTToolDeleteObject:@"UserInfo"];
}



/**
 用户登录按钮

 @param sender 登录按钮
 */
- (IBAction)loginBtn:(id)sender {
    
    //UIButton * loginBtn = (UIButton *)sender;
    //loginBtn.userInteractionEnabled = NO;
   
    if (!self.loginPhone.text.length ||  ![[HTTool HTToolShare] HTToolValidateMobile:self.loginPhone.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    if (!self.password.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"username"] = self.loginPhone.text;
    dict[@"input"] = [[MD5Encryption alloc] md5:self.password.text];
    dict[@"loginType"] = @"0";
    //dict[@"userType"] = @"0";
    
    [HTNetworkingTool HTNetworkingToolPost:@"user/login" parame:dict isHud:YES success:^(id json) {
        
        //loginBtn.userInteractionEnabled = YES;
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        LWLog(@"%@",json);
        if (base.resultCode == InterfaceSuccess) {
            [SVProgressHUD showSuccessWithStatus:base.resultMsg];
            UserInfo * model = [UserInfo mj_objectWithKeyValues:json[@"data"]];
            LWLog(@"%@",[model mj_keyValues]);
            [[HTTool HTToolShare] HTToolArchiveRootObject:model withPath:@"UserInfo"];

            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
        //loginBtn.userInteractionEnabled = YES;
    } failure:^(NSError *error) {
        //loginBtn.userInteractionEnabled = YES;
        LWLog(@"%@",[error description]);
    }];
}

- (void)dismiscurrent{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;


    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //        [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"main_title_left_back"] forState:UIControlStateNormal];
    //[button sizeToFit];
    button.bounds = CGRectMake(0, 0, 35, 35);
    //        button.titleLabel.font = kAdaptedFontSize(15);
    // 让按钮内部的所有内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    // 让按钮的内容往左边偏移10
    //button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button addTarget:self action:@selector(dismiscurrent) forControlEvents:UIControlEventTouchUpInside];
  
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [self setUpUI];
}





@end
