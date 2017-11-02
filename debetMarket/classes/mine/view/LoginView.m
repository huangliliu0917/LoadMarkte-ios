//
//  LoginView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()<UITextFieldDelegate>


@end


@implementation LoginView

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.alpha = 1;
        self.userInteractionEnabled = YES;
        [self setupInit];
    }
    return self;
}

- (void)setupInit{
    
    _titleLable = [[UILabel alloc] init];
    _titleLable.text = @"快速登录";
    _titleLable.font = kAdaptedFontSize(20);
    [self addSubview:_titleLable];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(kAdaptedHeight(10));
        make.height.mas_equalTo(20);
    }];
    
    _phone = [[UITextField alloc] init];
    _phone.keyboardType = UIKeyboardTypePhonePad;
    _phone.leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, 8, 5)];
    _phone.leftViewMode = UITextFieldViewModeAlways;
    _phone.delegate = self;
    _phone.layer.borderWidth = .7;
    _phone.placeholder = @"请填手机号";
    _phone.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _phone.layer.cornerRadius = 5;
    [_phone setClearsOnBeginEditing:YES];
    _phone.layer.masksToBounds = YES;
    [self addSubview:_phone];
    [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(kAdaptedHeight(15));
        make.left.equalTo(self.mas_left).offset(kAdaptedWidth(10));
        make.right.equalTo(self.mas_right).offset(-kAdaptedWidth(10));
        make.height.mas_equalTo(kAdaptedHeight(44));
    }];
    
    _code = [[UITextField alloc] init];
    _code.keyboardType = UIKeyboardTypePhonePad;
    _code.leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, 8, 5)];
    _code.leftViewMode = UITextFieldViewModeAlways;
    _code.delegate = self;
    [_code setClearsOnBeginEditing:YES];
    _code.placeholder = @" 请输入验证码 ";
    _code.layer.borderWidth = .7;
    _code.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _code.layer.cornerRadius = 5;
    _code.layer.masksToBounds = YES;
    [self addSubview:_code];
    [_code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phone.mas_bottom).offset(kAdaptedHeight(10));
        make.left.equalTo(self.mas_left).offset(kAdaptedWidth(10));
        make.right.equalTo(self.mas_right).offset(-kAdaptedWidth(110));
        make.height.mas_equalTo(kAdaptedHeight(44));
    }];
    
    _verification = [[UILabel alloc] init];
    _verification.layer.cornerRadius = 5;
    _verification.layer.masksToBounds = YES;
    _verification.backgroundColor = LWColor(22, 103, 249);
    _verification.text = @"获取验证码";
    _verification.textAlignment = NSTextAlignmentCenter;
    _verification.textColor = [UIColor whiteColor];
    _verification.font = kAdaptedFontSize(15);
    _verification.adjustsFontSizeToFitWidth = YES;
    _verification.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timeBack:)];
    [_verification addGestureRecognizer:tap];
    
    [self addSubview:_verification];
    [_verification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_code.mas_top);
        make.left.equalTo(self.code.mas_right).offset(kAdaptedWidth(10));
        make.right.equalTo(self.mas_right).offset(-kAdaptedWidth(10));
        make.height.mas_equalTo(kAdaptedHeight(44));
    }];
    
    UIView * slidS = [[UIView alloc] init];
    _slidS = slidS;
    slidS.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:slidS];
    [self.slidS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.verification.mas_bottom).offset(kAdaptedHeight(20));
        make.height.mas_equalTo(0.5);
        
    }];
    
    
    UIView * slid = [[UIView alloc] init];
    slid.backgroundColor = [UIColor lightGrayColor];
    _slid = slid;
    [self addSubview:slid];
    [_slid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(slidS.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.width.mas_equalTo(0.5);
    }];
    
    UIButton * btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn = btn;
    btn.tag = 200;
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    [btn setFrame:CGRectMake(0,0,60,30)];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 100;
//    [_cancelBtn.titleLabel setTextColor:[UIColor blackColor]];
    [self addSubview:btn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(2);
        make.top.equalTo(slidS.mas_bottom).offset(2);
        make.bottom.equalTo(self.mas_bottom).offset(2);
        make.right.equalTo(slid.mas_left).offset(2);
    }];
    
    _conformlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _conformlBtn.tag = 201;
//    [_conformlBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_conformlBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_conformlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_conformlBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_conformlBtn sizeToFit];
    _conformlBtn.tag = 101;
    [self addSubview:_conformlBtn];
    [_conformlBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(slid.mas_right);
        make.top.equalTo(slidS.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    
}


- (void)login{
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"mobile"] = self.phone.text;
    parame[@"verifyCode"] = self.code.text;
    [HTNetworkingTool  HTNetworkingToolPost:LoginInterface parame:parame success:^(id json) {
        LWLog(@"%@",json);
        if([[json objectForKey:@"resultCode"] intValue] == 2000){
            UserInfo * userInfo = [UserInfo mj_objectWithKeyValues:[json objectForKey:@"data"]];
            [NSKeyedArchiver archiveRootObject:userInfo toFile:KeyedArchive(@"userInfo")];
            [SVProgressHUD showSuccessWithStatus:[json objectForKey:@"resultMsg"]];
            if ([self.delegate respondsToSelector:@selector(LOginViewResult:)]) {
                [self.delegate LOginViewResult:nil];
            }
        }else{
            [SVProgressHUD showErrorWithStatus:[json objectForKey:@"resultMsg"]];
        }
        
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
}
- (void)buttonClick:(UIButton *)btn{
    
    if (btn.tag == 101) {
        if (!(self.code.text.length > 0) || !(self.phone.text.length > 0)) {
            [SVProgressHUD showInfoWithStatus:@"请入手机号或验证码"];
        }else{
            
            if ([self.delegate respondsToSelector:@selector(LoginViewClick:andPhone:andVerCode:)]) {
                [self.delegate LoginViewClick:1 andPhone:self.phone.text andVerCode:self.code.text];
            }
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(LoginViewClick:andPhone:andVerCode:)]) {
            [self.delegate LoginViewClick:0 andPhone:nil andVerCode:nil];
        }
        
    }
    LWLog(@"%@",btn);
    
    
}

- (BOOL) checkTel:(NSString *) phoneNumber{
    NSString *regex = @"^(1)\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phoneNumber];
}


- (void)getVerification{
    NSMutableDictionary * parame = [NSMutableDictionary dictionary];
    parame[@"mobile"] = self.phone.text;
    [HTNetworkingTool  HTNetworkingToolPost:verificationInterface parame:parame success:^(id json) {
        LWLog(@"%@",json);
        if ([[json objectForKey:@"resultCode"] integerValue] == 2000) {
            [SVProgressHUD showSuccessWithStatus:[json objectForKey:@"resultMsg"]];
        }else{
            [SVProgressHUD showErrorWithStatus:[json objectForKey:@"resultMsg"]];
        }
    } failure:^(NSError *error) {
        LWLog(@"%@",[error description]);
    }];
}

- (void)timeBack:(UITapGestureRecognizer *)tap{

    LWLog(@"%@",tap);
    UILabel *timeLable =(UILabel *)tap.view;
    if (![self checkTel:self.phone.text]) {
        [SVProgressHUD showInfoWithStatus:@"请输入正确手机号"];
    }else{
        [self getVerification];
        [self settime:timeLable];
    }
}

- (void)settime:(UILabel *)lable{
    
    /*************倒计时************/
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [lable setText:@" 获取验证码 "];
                lable.backgroundColor = LWColor(22, 103, 249);
                lable.userInteractionEnabled = YES;
            });
        }else{
            lable.userInteractionEnabled = NO;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{

                lable.backgroundColor = [UIColor lightGrayColor];
                [lable setText:[NSString stringWithFormat:@"%@秒重新发送",strTime]];

            });
            timeout--;
        }
        
    });
    dispatch_resume(_timer);
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phone) {
        if (textField.text.length > 10) {
            textField.text = [textField.text substringToIndex:10];
        }
        
    }
    if (textField == self.code) {
        if (textField.text.length > 5) {
            textField.text = [textField.text substringToIndex:5];
        }
    }
    
    return YES;
}
@end
