//
//  MineFooterView.h
//  debetMarket
//
//  Created by 罗海波 on 2018/2/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MineFooterViewDelegate <NSObject>

@end


@interface MineFooterView : UIView

@property(nonatomic,weak) id <MineFooterViewDelegate> delegate;

@end
