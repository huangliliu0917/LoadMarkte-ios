//
//  OrderDetailTableViewController.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

@interface OrderDetailTableViewController : UITableViewController

@property(nonatomic,copy) NSString * name;

@property(nonatomic,copy) NSString * phone;

@property(nonatomic,copy) NSString * idCard;

@property(nonatomic,assign) int tradeType;


// 是否来自订单列表
@property(nonatomic,strong) OrderModel * orderModel;

@end
