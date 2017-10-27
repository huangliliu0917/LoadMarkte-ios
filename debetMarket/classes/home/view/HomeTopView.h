//
//  HomeTopView.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTopViewDelegate <NSObject>

- (void)HomeTopView:(int)type;

@end



@interface HomeTopView : UIView


+ (instancetype)HomeTopViewFromXib;


@property(nonatomic,weak) id <HomeTopViewDelegate> delegate;

@end
