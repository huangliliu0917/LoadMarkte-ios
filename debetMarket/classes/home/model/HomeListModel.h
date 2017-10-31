//
//  HomeListModel.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/23.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListModel : NSObject

@property(nonatomic,assign) NSNumber * applicationMaterial;
@property(nonatomic,assign) NSNumber *  applyType;
@property(nonatomic,copy) NSString * applyUrl;
@property(nonatomic,assign) NSNumber *  categories;
@property(nonatomic,copy) NSString * contacter;
@property(nonatomic,assign) NSNumber *  createTime;
@property(nonatomic,copy) NSString * deadline;
@property(nonatomic,assign) NSNumber * deadlineUnit;
@property(nonatomic,assign) NSNumber * desc;
@property(nonatomic,copy) NSString * enableMoney;
@property(nonatomic,assign) NSNumber * fastestGetTime;
@property(nonatomic,assign) NSNumber * loanId;
@property(nonatomic,copy) NSString * interestRate;
@property(nonatomic,assign) int isDelete;
@property(nonatomic,assign) int  isHot;
@property(nonatomic,assign) int isNew;
@property(nonatomic,copy) NSString * logo;
@property(nonatomic,copy) NSNumber * maxMoney;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * phone;
@property(nonatomic,copy) NSString * tag;
@property(nonatomic,assign) int topSortNum;


@end
