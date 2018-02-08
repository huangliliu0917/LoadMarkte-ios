//
//  OrderCreateModel.m
//  debetMarket
//
//  Created by 罗海波 on 2018/2/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderCreateModel.h"

@implementation OrderCreateModel

+ (NSDictionary *)objectClassInArray{
    return @{@"payments":[Payment  class]};
}

@end
