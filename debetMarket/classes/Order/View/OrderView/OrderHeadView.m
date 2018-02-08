//
//  OrderHeadView.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderHeadView.h"

@interface OrderHeadView ()

@property (nonatomic,strong) UILabel * orderNum;

@property (nonatomic,strong) UILabel * orderMoney;

@end


@implementation OrderHeadView


- (instancetype)init{
    if (self = [super init]) {
        
        self.orderNum = [[UILabel alloc] init];
        self.orderNum.frame = CGRectMake(0, 0, KScreenWidth, 44);
        self.orderNum.backgroundColor = [UIColor whiteColor];
        self.orderNum.text = @"    订单号: 201801001010";
        self.orderNum.font = kAdaptedFontSize(15);
        self.orderNum.textColor = [UIColor blackColor];
        [self addSubview:self.orderNum];
        
        self.orderMoney = [[UILabel alloc] init];
        self.orderMoney.frame = CGRectMake(0, 49, KScreenWidth, 44);
        self.orderMoney.text = @"    黑名单查询: 10元";
        self.orderMoney.backgroundColor = [UIColor whiteColor];
        self.orderMoney.font = kAdaptedFontSize(15);
        [self addSubview:self.orderMoney];
        self.orderMoney.textColor = [UIColor blackColor];
        self.backgroundColor = LWColor(241, 242, 243);
        
    }
    return self;
}

- (void)setOrder:(PayInfo *)order{
    _order = order;
    
    if(order.tradeType == 0) {
       self.orderMoney.text = [NSString stringWithFormat:@"    黑名单查询:%@元",order.surplusAmount];
    }else if(order.tradeType == 1){
       self.orderMoney.text = [NSString stringWithFormat:@"    金融黑名单:%@元",order.surplusAmount];
    }else if(order.tradeType == 2){
       self.orderMoney.text = [NSString stringWithFormat:@"    运营商:%@元",order.surplusAmount];
    }else if(order.tradeType == 3){
       self.orderMoney.text = [NSString stringWithFormat:@"    淘宝:%@元",order.surplusAmount];
    }else if(order.tradeType == 4){
       self.orderMoney.text = [NSString stringWithFormat:@"    京东:%@元",order.surplusAmount];
    }
    
    self.orderNum.text = [NSString stringWithFormat:@"    订单号:%@",order.orderNo];
}

@end
