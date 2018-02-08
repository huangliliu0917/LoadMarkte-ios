//
//  Payment.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Payment : NSObject

@property(nonatomic,strong) NSString * name;

@property(nonatomic,assign) int payType;

@property(nonatomic,strong) NSString * remark;


@end
