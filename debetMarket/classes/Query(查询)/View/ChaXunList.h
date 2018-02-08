//
//  ChaXunList.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChaXunList : UIView

// 0 黑名单  1 运营商  2 电商
@property(nonatomic,assign) int cate;

//0 上  1 下
@property(nonatomic,assign) int type;

@end
