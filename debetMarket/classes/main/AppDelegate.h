//
//  AppDelegate.h
//  debetMarket
//
//  Created by lhb on 2017/10/17.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//0=变包，1=正常包,默认变包
@property (nonatomic,assign) int packageType;


@property (nonatomic,strong) UIViewController * currentVC;

@property (nonatomic,copy) NSString * returnUrl;

@end

