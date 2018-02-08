//
//  OrderListTableViewCell.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/8.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderModel.h"

//头
@interface headView:UIView

@property(nonatomic,strong) OrderModel * orderModel;
@end


// 中间
@interface Center:UIView
@property(nonatomic,strong) OrderModel * orderModel;

@end


//底部
@interface BottomView:UIView
@property(nonatomic,strong) OrderModel * orderModel;

@end





@interface OrderListTableViewCell : UITableViewCell


@property(nonatomic,strong) OrderModel * orderModel;


@end
