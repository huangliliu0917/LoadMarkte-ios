//
//  LoginView.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@protocol LoginViewDelegate <LoginViewControllerDelegate>


/**
 * 提交登陆信息
 **/
- (void)LoginViewClick:(int)type andPhone:(NSString *)phoneNumber andVerCode:(NSString *)code;

//- (void)LOginViewResult;

@end

@interface LoginView : UIView

@property(nonatomic,weak) id <LoginViewDelegate> delegate;

@property(nonatomic,strong) UILabel * titleLable;
@property(nonatomic,strong) UITextField * phone;
@property(nonatomic,strong) UITextField * code;
@property(nonatomic,strong) UILabel * verification;
@property(nonatomic,strong) UIButton  * cancelBtn;
@property(nonatomic,strong) UIButton  * conformlBtn;
@property(nonatomic,strong) UIView * slid;
@property(nonatomic,strong) UIView * slidS;


@end
