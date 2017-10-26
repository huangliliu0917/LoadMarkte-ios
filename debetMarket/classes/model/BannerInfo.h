//
//  BannerInfo.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/25.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerInfo : NSObject

/**广告详情*/
@property(nonatomic,copy) NSString * clickLink;
/**倒记时时间*/
@property(nonatomic,assign) int  showTime;
/**图片地址*/
@property(nonatomic,copy) NSString * imgLink;
@end
