//
//  TestView.h
//  debetMarket
//
//  Created by 罗海波 on 2017/10/20.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TestViewDelegate <NSObject>

- (void)TestViewClick:(HomeListModel *)model;


@end

@interface TestView : UIView

@property(nonatomic,strong) NSArray * dataArray;

- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray <HomeListModel *>*)data;


@property(nonatomic,weak) id <TestViewDelegate> delegate;

@end
