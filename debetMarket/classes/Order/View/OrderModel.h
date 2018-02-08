//
//  OrderModel.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/28.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property(nonatomic,copy) NSString * orderId; //订单号
@property(nonatomic,copy) NSString * orderName; //订单标题
@property(nonatomic,copy) NSString * desc; //订单描述

@property(nonatomic,copy) NSString * status; //状态0已取消 1待支付 2认证中 3认证成功 4认证失败
@property(nonatomic,copy) NSString * statusName; // 状态名称
@property(nonatomic,copy) NSString * createTime; //时间
@property(nonatomic,copy) NSString * thirdAuthUrl; // 第三方授权页面,只有认证中状态下有数据


@end
