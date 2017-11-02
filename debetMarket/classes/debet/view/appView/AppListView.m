//
//  AppListView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/11/2.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "AppListView.h"

@interface AppListView()

@property (nonatomic ,strong) UIImageView * pictrueImageView;
@property (nonatomic ,strong) UILabel * titleLabel;

@end
@implementation AppListView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.pictrueImageView];
        [self.pictrueImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(10);
            //make.left.mas_equalTo(self.contentView.mas_left).offset(10);
            make.left.mas_equalTo(self).offset(10);
            //top对top  mas_top //left对应left mas_left可以省略
            make.width.height.mas_equalTo(30);
            make.bottom.mas_offset(10);
        }];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.pictrueImageView.mas_top).offset(10);
            make.centerY.mas_equalTo(self.pictrueImageView.mas_centerY);
//            make.left.mas_equalTo(self.pictrueImageView).offset(10);
//            make.right.mas_equalTo(self).offset(-10);
//            make.bottom.mas_equalTo(self).offset(-10);
        }];
    }
    return self;
}

@end
