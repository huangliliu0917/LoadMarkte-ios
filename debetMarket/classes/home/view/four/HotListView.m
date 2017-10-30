//
//  HotListView.m
//  debetMarket
//
//  Created by 罗海波 on 2017/10/30.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HotListView.h"

@interface HotListView()


@property(nonatomic,strong) UIImageView *  iconView;
@property(nonatomic,strong) UILabel *  titleLable;
@property(nonatomic,strong) UILabel *  fuLbale;
@end


@implementation HotListView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self= [super initWithFrame:frame]) {
        
      
        _iconView = [[UIImageView alloc] init];
        [self addSubview:_iconView];
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(kAdaptedHeight(2));
            make.left.equalTo(self.mas_left).offset(kAdaptedWidth(2));
            make.bottom.equalTo(self.mas_bottom).offset(kAdaptedHeight(2));
            make.width.mas_equalTo(_iconView.mas_height);
        }];
        
        _titleLable = [[UILabel alloc] init];
        [self addSubview:_titleLable];
        
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_iconView.mas_top).mas_offset(kAdaptedHeight(2));
            make.left.mas_equalTo(_iconView.mas_right).mas_offset(kAdaptedWidth(2));
        }];
        
        _fuLbale = [[UILabel alloc] init];
        [self addSubview:_fuLbale];
        [_fuLbale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLable.mas_top);
            make.left.mas_equalTo(_titleLable.mas_left);
        }];
    }
    
    return self;
    
}

@end
