//
//  LoginViewController.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTViewController.h"
#import "HomeListModel.h"


@protocol LoginViewControllerDelegate <NSObject>


// 1 表示首页列表   
- (void)logionSuccess:(int)type withData:(HomeListModel *)model;

- (void)logionSuccessToS:(int)type;

@end

@interface LoginViewController : UIViewController

//
@property(nonatomic,assign) int isHomeTop;

@property(nonatomic,assign) int type;

//首页列表
@property(nonatomic,strong) HomeListModel * homeModel;


@property(nonatomic,weak) id <LoginViewControllerDelegate> delegate;

@end
