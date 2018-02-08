//
//  MineBottomView.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/2.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MineBottomViewDelegate <NSObject>

// 0 已认证   1 表示未认证
- (void) mineBottomViewClick:(int)option;


@end


@interface MineBottomView : UIView

@property(nonatomic,weak) id <MineBottomViewDelegate> delegate;

- (void)setInit:(int)certifiedCount andUn:(int)unverifiedCount;
@end
