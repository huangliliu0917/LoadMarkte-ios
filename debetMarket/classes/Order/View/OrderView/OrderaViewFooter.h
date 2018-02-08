//
//  OrderaViewFooter.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>




@protocol OrderaViewFooterDelegate <NSObject>

- (void)lijizhifu:(int)upStatus andDownStatus:(int)downStatus;

@end




@interface OrderaViewFooter : UIView


@property(nonatomic,strong) PayInfo *  order;

@property(nonatomic,weak) id <OrderaViewFooterDelegate>  delegate;


@end
