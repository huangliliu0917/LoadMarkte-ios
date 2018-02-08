//
//  UserInfo.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

//用户名 
@property(nonatomic,copy) NSString * nickName;
//昵称 
@property(nonatomic,copy) NSString * realName;
//头像链接 
@property(nonatomic,copy) NSString * createTime;
//用户token 
@property(nonatomic,strong) NSString * userId;
//用户token 
@property(nonatomic,strong) NSNumber * isFreeze;

@property(nonatomic,copy) NSString * account;

@property(nonatomic,copy) NSString * idCard;


@property(nonatomic,copy) NSString * userToken;

@property(nonatomic,copy) NSString * userName;


@property(nonatomic,copy) NSString * headimg;

@end
