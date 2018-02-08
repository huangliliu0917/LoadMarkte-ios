//
//  OrderCreateModel.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/6.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Payment.h"


@interface OrderCreateModel : NSObject

@property(nonatomic,strong) NSNumber * finalAmount;

@property(nonatomic,strong) NSString  * tradeName;

@property(nonatomic,strong) NSArray * payments;

@end
