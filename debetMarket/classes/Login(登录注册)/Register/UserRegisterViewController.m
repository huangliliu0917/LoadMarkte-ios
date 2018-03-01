//
//  UserRegisterViewController.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/7.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "UserRegisterViewController.h"

@interface UserRegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *iphoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *passwd;
@property (weak, nonatomic) IBOutlet UITextField *messgeCode;
@property (weak, nonatomic) IBOutlet UILabel *messLable;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;


@property (weak, nonatomic) IBOutlet UILabel *messageLablsc;


/**
 会员类型
 */
@property (weak, nonatomic) IBOutlet UILabel *huiyuanleixing;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeight;


@property (weak, nonatomic) IBOutlet UIButton *gouXuanZhuCe;

// 是否勾选阅读条约
@property (assign, nonatomic) bool isYueDuTiaoYue;


@end

@implementation UserRegisterViewController


- (void)getCode{
    
    if (!self.iphoneNumber.text.length ||  ![[HTTool HTToolShare] HTToolValidateMobile:self.iphoneNumber.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"mobile"] = self.iphoneNumber.text;
    dict[@"safecode"] = @"";
    [HTNetworkingTool HTNetworkingToolPost:@"sys/sendVerifyCode" parame:dict isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == InterfaceSuccess) {
            [SVProgressHUD showSuccessWithStatus:@"验证码发送成功"];
        }else{
            [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        [self getCode];
    }];
    
}
- (void)setUpInit{
    
    
    self.huiyuanleixing.userInteractionEnabled = YES;
    __weak typeof(self) wself = self;
    //点击
    //NSString * url =  [[NSUserDefaults standardUserDefaults] objectForKey:@"qrcodeLink"];
//    [self.huiyuanleixing bk_whenTapped:^{
//        PushWebViewController * pc = [[PushWebViewController alloc] init];
//        pc.funUrl = url;
//        [wself.navigationController pushViewController:pc animated:YES];
//    }];
    
//    self.navigationController.navigationBar.tintColor = LWColor(237, 237, 237);
//    self.view.backgroundColor = LWColor(237, 237, 237);
    //先得到一个字符串
    NSString * headerString = [NSString stringWithFormat:@"我已阅读并同意 《注册服务协议》"];
    LWLog(@"%lu",(unsigned long)headerString.length);
    //计算需要设置变色的字符的长度和开始位置
    NSInteger len1 = 6;
    NSInteger loc1 = 9 ;

    //创建一个属性字符串
    NSMutableAttributedString * headerMutableString = [[NSMutableAttributedString alloc]initWithString:headerString];
    [headerMutableString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(loc1, len1)];
    _messageLablsc.attributedText = headerMutableString;
    
    _messageLablsc.userInteractionEnabled = YES;
    
    //NSString * ir =  [[NSUserDefaults standardUserDefaults] objectForKey:@"lenderRegisterLink"];
    [self.messageLablsc bk_whenTapped:^{
        PushWebViewController * pc = [[PushWebViewController alloc] init];
        pc.funUrl = [[NSUserDefaults standardUserDefaults]  objectForKey:@"regAgreementUrl"];
        [wself.navigationController pushViewController:pc animated:YES];
    }];
    
    
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.backgroundColor  = AppMainColor;
    self.navigationController.navigationBarHidden = NO;
    if (self.type == 1) {
        self.topHeight.constant = 0;
        self.messageLablsc.hidden = YES;
        self.navigationItem.title = @"忘记密码";
        [self.registerBtn setTitle:@"修改密码" forState:UIControlStateNormal];
        self.gouXuanZhuCe.hidden = YES;
    }else{
        self.navigationItem.title = @"账号注册";
        
    }
    CGRect fm = self.messLable.frame;
    self.messLable.layer.cornerRadius = fm.size.height * 0.5;
    self.messLable.layer.masksToBounds = YES;
    
    self.messLable.userInteractionEnabled = YES;
    [self.messLable bk_whenTapped:^{
        if ([[HTTool HTToolShare] HTToolValidateMobile:self.iphoneNumber.text]) {
            [self begainCountDown];
            [self getCode];
        }else{
            [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        }
        
    }];
}

- (IBAction)gouxuan:(id)sender {
    
    UIButton * btn = (UIButton *)sender;
    if (btn.selected) {
        
        [btn setImage:[UIImage imageNamed:@"checOut"] forState:UIControlStateNormal];
        btn.selected = false;
    }else{
        [btn setImage:[UIImage imageNamed:@"checkOn"] forState:UIControlStateSelected];
        btn.selected = true;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.currentVC = self;
    
    
    [self.gouXuanZhuCe sizeToFit];
    
    self.isYueDuTiaoYue = true;
    
    
    
    [self setUpInit];
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.iphoneNumber) {
        
        
    }
    
    return YES;
}

- (IBAction)closeClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)registerBtnClick:(id)sender {
    [self doLogin];
}

- (void)doLogin{
    
    
    if (!self.iphoneNumber.text.length ||  ![[HTTool HTToolShare] HTToolValidateMobile:self.iphoneNumber.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    
    
    if (!(self.passwd.text.length >= 6)) {
        [SVProgressHUD showErrorWithStatus:@"密码不能少于6位"];
        return;
    }
    
    if (!(self.messgeCode.text.length > 0)) {
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
        return;
    }
    
    if (!self.type) {
        if (!self.gouXuanZhuCe.selected) {
            [SVProgressHUD showErrorWithStatus:@"请阅读并同意注册协议"];
            return;
        }
        
    }
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"username"] = self.iphoneNumber.text;
    dict[@"verifyCode"] = self.messgeCode.text;
    NSString * face;
    LWLog(@"%@",self.passwd.text);
    if (self.type == 1) { // 忘记密码
        face = @"user/updatePassword";
        dict[@"newPassword"] = [MD5Encryption md5by32:self.passwd.text];
    }else{ //注册
        face = @"user/register";
        dict[@"password"] = [MD5Encryption md5by32:self.passwd.text];
    }
    LWLog(@"%@----%@",face,dict);
    [HTNetworkingTool HTNetworkingToolPost:face parame:dict isHud:YES success:^(id json) {
        LWLog(@"%@",json);
        BaseInterface * base = [BaseInterface mj_objectWithKeyValues:json];
        if (base.resultCode == InterfaceSuccess) {
            UserInfo * user = [UserInfo mj_objectWithKeyValues:json[@"data"]];
            [[HTTool HTToolShare] HTToolArchiveRootObject:user withPath:@"UserInfo"];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
           [SVProgressHUD showErrorWithStatus:base.resultMsg];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",error.description);
        //[self doLogin];
    }];
    
}

- (void)begainCountDown{
    __block NSInteger timeout = 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.messLable.userInteractionEnabled = YES;
                self.messLable.text = @"获取验证码";
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                self.messLable.userInteractionEnabled = NO;
                self.messLable.text = [NSString stringWithFormat:@"%ld重新获取",(long)timeout];
            });
            timeout = timeout - 1;
        }
    });
    dispatch_resume(_timer);
}

@end
