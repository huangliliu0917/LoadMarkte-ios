//
//  PushWebViewController.h
//  HuoBanMallBuy
//
//  Created by lhb on 15/10/9.
//  Copyright (c) 2015年 HT. All rights reserved.
//  跳转的网页页面

#import <UIKit/UIKit.h>

@protocol PushWebViewDelegate <NSObject>



@end


@interface PushWebViewController : HTViewController

//首页列表
@property(nonatomic,strong) HomeListModel * homeModel;

/***/
@property(nonatomic,strong) NSString * funUrl;


@property(nonatomic,weak) id <PushWebViewDelegate > delegate;

@end
