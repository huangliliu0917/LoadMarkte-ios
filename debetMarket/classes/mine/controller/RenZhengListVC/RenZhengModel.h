//
//  RenZhengModel.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/7.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RenZhengModel : NSObject


@property(nonatomic,assign) int userId;

@property(nonatomic,copy) NSString * userName;

@property(nonatomic,copy) NSString * name;


@property(nonatomic,copy) NSString * statusName;

@property(nonatomic,assign) int status;
@property(nonatomic,copy) NSString * inviteTime;



@end
