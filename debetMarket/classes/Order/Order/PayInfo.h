//
//  PayInfo.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/12/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PayInfo : NSObject

@property(nonatomic,strong) NSDictionary * bizParameters;


@property(nonatomic,strong) NSString * orderNo;

@property(nonatomic,assign) int payType;


@property(nonatomic,strong) NSNumber * surplusAmount;


@property(nonatomic,assign) int tradeType;


@property(nonatomic,copy) NSString * thirdAuthUrl;

@end
