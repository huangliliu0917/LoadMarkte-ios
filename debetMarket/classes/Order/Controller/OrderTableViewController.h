//
//  OrderTableViewController.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RenZhengModel.h"

@interface OrderTableViewController : UITableViewController

// 认证列表
@property(nonatomic,strong) RenZhengModel * model;
@end
