//
//  MineHeadView.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MineHeadViewDelegate <NSObject>


/**个人中心头部点击选项*/   // 0 图像   1 lable  2 认证  3 未认证
- (void)mineHeadOptionClick:(int)tag;


@end


@interface MineHeadView : UIView

@property(nonatomic,weak) id <MineHeadViewDelegate> delegate;

@property (nonatomic,strong) UserInfo * usermodel;


- (void)setInit:(int)certifiedCount andUn:(int)unverifiedCount;


- (void)setHeadImage:(UIImage *)iconView;


@end
