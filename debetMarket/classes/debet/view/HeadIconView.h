//
//  HeadIconView.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/21.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadIconViewDelegate <NSObject>


- (void)HeadIconClick:(CateGoryModel *)model;


@end

@interface HeadIconView : UIView

@property(nonatomic,strong) NSMutableArray <CateGoryModel *>* dataArray;

@property(nonatomic,weak) id <HeadIconViewDelegate> delegate;

@end
